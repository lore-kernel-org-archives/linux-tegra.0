From: Bryan Wu <cooloney@gmail.com>
Subject: Can I put a V4L2 soc camera driver under other subsystem directory?
Date: Wed, 7 Aug 2013 18:53:28 -0700
Message-ID: <CAK5ve-J7Sn5wuJ_z6Lqr=_qMQRqF12Aa6GfTv4xBhh=n_28Yjg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-media-owner@vger.kernel.org>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org, Guennadi Liakhovetski <g.liakhovetski@gmx.de>, dri-devel@lists.freedesktop.org
Cc: Thierry Reding <thierry.reding@gmail.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-tegra <linux-tegra@vger.kernel.org>, =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi Guennadi and LMML,

I'm working on a camera controller driver for Tegra, which is using
soc_camera. But we also need to use Tegra specific host1x interface
like syncpt APIs.

Since host1x is quite Tegra specific framework which is in
drivers/gpu/host1x and has several host1x's client driver like graphic
2D driver, my v4l2 soc_camera driver is also a host1x client driver.
Right now host1x does not expose any global include header files like
API in the kernel, because no other users. So we plan to put all
host1x related driver together, is that OK for us to put our Tegra
soc_camera driver into drivers/gpu/host1x/camera or similar?

I guess besides it will introduce some extra maintenance it should be OK, right?

Thanks,
-Bryan
