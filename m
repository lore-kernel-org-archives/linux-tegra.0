From: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>
Subject: [PATCH 0/7] staging: make non-modular code explicitly non-modular
Date: Sun, 11 Oct 2015 15:47:27 -0400
Message-ID: <1444592854-30683-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Paul Gortmaker <paul.gortmaker-CWA4WttNNZF54TAoqtyWWQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Chris Rorvick <chris-FAYdYWbMHyxBDgjK7y7TUQ@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, "Gujulan Elango, Hari Prasath (H.)" <hgujulan-Vi+0cqmPEYlBDgjK7y7TUQ@public.gmane.org>, Haneen Mohammed <hamohammed.sa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, Riley Andrews <riandrews-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Roberta Dobrescu <roberta.dobrescu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Tapasweni Pathak <tapaswenipathak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Vincenzo Scotti <vinc94-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

In a previous merge window, we made changes to allow better
delineation between modular and non-modular code in commit
0fd972a7d91d6e15393c449492a04d94c0b89351 ("module: relocate module_init
from init.h to module.h").  This allows us to now ensure module code
looks modular and non-modular code does not accidentally look modular
just to avoid suffering build breakage.

Here we target code that is, by nature of their Makefile and/or
Kconfig settings, only available to be built-in, but implicitly
presenting itself as being possibly modular by way of using modular
headers, macros, and functions.

The goal here is to remove that illusion of modularity from these
files, but in a way that leaves the actual runtime unchanged.
In doing so, we remove code that has never been tested and adds
no value to the tree.  And we continue the process of expecting a
level of consistency between the Kconfig/Makefile of code and the
code in use itself.

There are two exceptions to unchanged runtime here:  The first is
in emxx_udc.c driver: one previously could use sysfs to unbind the
driver which would try and use a .remove function that the linker
should have dropped as it was __exit.  We simply disable
unbind/bind for this driver.  The second is for Tegra ION memory
manager; it clearly was intended to be tristate but the makefile
did not allow it to be; that is now fixed.

Build tested on staging-testing from Sat, on ARM, since the majority
of drivers here are Android related.=20

Paul.
--

Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "Arve Hj=C3=B8nnev=C3=A5g" <arve-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Chris Rorvick <chris-FAYdYWbMHyxBDgjK7y7TUQ@public.gmane.org>
Cc: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: "Gujulan Elango, Hari Prasath (H.)" <hgujulan-Vi+0cqmPEYlBDgjK7y7TUQ@public.gmane.org>
Cc: Haneen Mohammed <hamohammed.sa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Cc: Peter Chen <peter.chen-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Cc: Riley Andrews <riandrews-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Roberta Dobrescu <roberta.dobrescu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Tapasweni Pathak <tapaswenipathak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Vincenzo Scotti <vinc94-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org

--=20
2.6.1
Paul Gortmaker (7):
  drivers/staging: make android ashmem.c explicitly non-modular
  drivers/staging: make android ion_page_pool.c explicitly non-modular
  drivers/staging: make android tegra_ion.c properly tristate
  drivers/staging: make android sw_sync.c explicitly non-modular
  drivers/staging: make android lowmemorykiller.c explicitly non-modula=
r
  drivers/staging: make android timed_output.c explicitly non-modular
  drivers/staging: make emxx_udc.c explicitly non-modular

 drivers/staging/android/ashmem.c            | 20 +++-------------
 drivers/staging/android/ion/ion_page_pool.c | 10 ++------
 drivers/staging/android/ion/tegra/Makefile  |  2 +-
 drivers/staging/android/lowmemorykiller.c   | 18 ++++++--------
 drivers/staging/android/sw_sync.c           | 11 ++-------
 drivers/staging/android/timed_output.c      | 16 +++----------
 drivers/staging/emxx_udc/emxx_udc.c         | 37 ++++-----------------=
--------
 7 files changed, 22 insertions(+), 92 deletions(-)

--=20
2.6.1
