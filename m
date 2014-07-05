From: Pawel Lebioda <pawel.lebioda89-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH 0/2] staging: nvec: fix some coding style problems
Date: Sat,  5 Jul 2014 22:30:54 +0200
Message-ID: <cover.1404586529.git.pawel.lebioda89@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The following patches fix some warnings reported by checkpatch.pl

Pawel Lebioda (2):
  staging: nvec: remove unnecessary 'else' after 'return' statement
  staging: nvec: remove unneccessary 'out of memory' message

 drivers/staging/nvec/nvec.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

-- 
1.8.3.2
