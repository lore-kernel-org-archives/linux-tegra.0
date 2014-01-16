From: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: A question about DT support for soc_camera
Date: Wed, 15 Jan 2014 17:48:01 -0800
Message-ID: <CAK5ve-LbvQACmaZC4gFBf=Ca_nwp7KvvT+dLBhbipxRdLFYonw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Guennadi,

I'm working on upstream our Tegra soc_camera host driver. But found
the soc_camera framework is not fully supporting Device Tree probing,
am I wrong about that? While in upstream Tegra kernel, we only support
DT probing and there is no board files.

Current soc_camera framework needs to put soc_camera_link information
in a board file and build up soc-camera-pdrv platform_device, then
finally register this soc-camera-pdrv platform_device.

For the host driver, we can do DT probing but for i2c soc_camera
sensor driver I failed to find any DT probing in upstream kernel. So
how to do that without an board file but use DT for this whole thing?

Can we use DT like this?
DTB file will pass those I2C, clock, regulator, GPIO information to
host driver. During host driver DT probing, we dynamically create
soc-camera-pdrv platform_device and soc_camera_link then register
them. Then the rest of the thing should be the same as None-DT
probing.

Any comments, thanks.
-Bryan
