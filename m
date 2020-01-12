From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 0/2] NVIDIA Tegra serial driver improvements
Date: Sun, 12 Jan 2020 21:09:17 +0300
Message-ID: <20200112180919.5194-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-serial-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This series is a complement to [1], which changed APB DMA driver's runtime
PM to make DMA clock enabled only during of actual transfer activity.
Unfortunately turned out that it wasn't enough because serial driver keeps
RX DMA active all the time in practice and that's what the first patch of
this series addresses. Secondly, I noticed that DMA synchronization could
be improved, it is also addressed now. Please review and apply, thanks in
advance!

Dmitry Osipenko (2):
  tty: serial: tegra: Activate RX DMA transfer by request
  tty: serial: tegra: Optimize DMA buffer synchronization

 drivers/tty/serial/serial-tegra.c | 94 ++++++++++++++++++-------------
 1 file changed, 55 insertions(+), 39 deletions(-)

-- 
2.24.0
