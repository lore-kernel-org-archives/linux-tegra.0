From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/6] video: tegra: Add nvhost driver
Date: Mon, 26 Nov 2012 11:33:52 +0200
Message-ID: <50B33780.6030708@nvidia.com>
References: <1353577684-7896-1-git-send-email-tbergstrom@nvidia.com> <1353577684-7896-2-git-send-email-tbergstrom@nvidia.com> <20121123233855.GD21555@avionic-0098.adnet.avionic-design.de> <50B07084.40707@nvidia.com> <20121124190416.GC26154@avionic-0098.adnet.avionic-design.de> <50B32690.7020102@nvidia.com> <20121126092524.GB8602@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121126092524.GB8602-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 26.11.2012 11:25, Thierry Reding wrote:
> I think I understand what you're saying. While I agree that it might be
> better to move host1x out of tegra-drm in the long term, in particular
> because other frameworks like V4L2 will start to use it eventually, I
> have some reservations about whether it makes sense to do it right away.
> 
> Furthermore as I understand it, most of the work required to use
> tegra-drm downstream would involve changes to the userspace components,
> wouldn't it? None of that would be dependent on where in the kernel the
> host1x driver resides.

If we start using tegradrm in downstream and it takes over host1x, we'd
lose ability to operate 3D, camera and multimedia hw. In current form we
expose enough APIs to add support for them in separate drivers.

Terje
