/************************************************************************
 * Licensed under Public Domain (CC0)                                    *
 *                                                                       *
 * To the extent possible under law, the person who associated CC0 with  *
 * this code has waived all copyright and related or neighboring         *
 * rights to this code.                                                  *
 *                                                                       *
 * You should have received a copy of the CC0 legalcode along with this  *
 * work. If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.*
 ************************************************************************/

package com.github.pwittchen.streams;

import com.github.pwittchen.streams.AsyncIterablePublisher;
import java.util.Iterator;
import java.util.concurrent.Executor;

public class InfiniteIncrementNumberPublisher extends AsyncIterablePublisher<Integer> {
  public InfiniteIncrementNumberPublisher(final Executor executor) {
    super(() -> new Iterator<>() {
      private int at = 0;

      @Override public boolean hasNext() {
        return true;
      }

      @Override public Integer next() {
        return at++;
      } // Wraps around on overflow

      @Override public void remove() {
        throw new UnsupportedOperationException();
      }
    }, executor);
  }
}