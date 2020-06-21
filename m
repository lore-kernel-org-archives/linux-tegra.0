From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 0/2] Improve descriptions of a few simple-panels
Date: Mon, 22 Jun 2020 01:27:40 +0300
Message-ID: <20200621222742.25695-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello,

This is a follow up to [1], which was already applied to drm-misc and then
Laurent Pinchart spotted some problems. This series addresses those problems.

[1] https://patchwork.ozlabs.org/project/linux-tegra/patch/20200617222703.17080-8-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org/

Dmitry Osipenko (2):
  drm/panel-simple: Correct EDT ET057090DHU connector type
  drm/panel-simple: Add missing BUS descriptions for some panels

 drivers/gpu/drm/panel/panel-simple.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

-- 
2.26.0
