From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [REPOST PATCH 0/2] Table lookup for mux clock type
Date: Fri, 22 Feb 2013 17:02:27 +0200
Message-ID: <1361545358-22721-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patchset adds a table lookup feature to the mux clock type. This will
be used by the forthcoming Tegra114 clock implementation. Also instead of
a fixed field width, a mask is used. This is because Tegra114 has some muxes
where the parent selector is spread over several bitfields. The second patch
adapts the tegra periph clock implementation which uses struct clk_mux
directly.

--

Mike,

This patch is a dependency for the Tegra114 CCF implementation. Could you
review it and merge on a topic branch so Stephen can pull it in to verify
the integration?

Thanks,

Peter.

Peter De Schrijver (2):
  clk: add table lookup to mux
  clk: tegra: adapt tegra periph clk to mux table/mask

 drivers/clk/clk-mux.c        |   51 ++++++++++++++++++++++++++++++++---------
 drivers/clk/tegra/clk.h      |   27 +++++++++++++++------
 include/linux/clk-private.h  |    3 +-
 include/linux/clk-provider.h |    9 ++++++-
 4 files changed, 69 insertions(+), 21 deletions(-)

-- 
1.7.7.rc0.72.g4b5ea.dirty
