From: Aaron Plattner <aplattner-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: xf86-video-tegra or xf86-video-modesetting?
Date: Mon, 26 Nov 2012 09:45:50 -0800
Message-ID: <50B3AACE.3050908@nvidia.com>
References: <20121124210916.GB27042@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121124210916.GB27042-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org" <xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/24/2012 01:09 PM, Thierry Reding wrote:
> Hi,
>
> With tegra-drm going into Linux 3.8 and NVIDIA posting initial patches
> for 2D acceleration on top of it, I've been looking at the various ways
> how this can best be leveraged.
>
> The most obvious choice would be to start work on an xf86-video-tegra
> driver that uses the code currently in the works to implement the EXA
> callbacks that allow some of the rendering to be offloaded to the GPU.
> The way I would go about this is to fork xf86-video-modesetting, do some
> rebranding and add the various bits required to offload rendering.

 From a purely logistical standpoint, if you do choose to create a fork, calling 
it xf86-video-tegra might be a problem since there's already an existing 
tegra_drv.so.

You could probably graft tegradrm support onto xf86-video-nv pretty easily, if 
you want to reuse an existing driver package.

-- Aaron
