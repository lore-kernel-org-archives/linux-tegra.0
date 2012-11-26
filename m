From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/6] video: tegra: Add nvhost driver
Date: Mon, 26 Nov 2012 10:21:36 +0200
Message-ID: <50B32690.7020102@nvidia.com>
References: <1353577684-7896-1-git-send-email-tbergstrom@nvidia.com> <1353577684-7896-2-git-send-email-tbergstrom@nvidia.com> <20121123233855.GD21555@avionic-0098.adnet.avionic-design.de> <50B07084.40707@nvidia.com> <20121124190416.GC26154@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121124190416.GC26154-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 24.11.2012 21:04, Thierry Reding wrote:
>>> I would really like this to be phased in in more manageable chunks. For
>>> instance syncpoints could be added on top of the existing host1x
>>> infrastructure (the display controllers can make use of it for VBLANK
>>> reporting, right?), followed by channel support for command submission.

I staged nvhost into 4 patches that each add some functionality:
 * Add driver with API to read and increment sync point values
 * Add syncpt wait and interrupt infrastructure
 * Add channel and client support and related infrastructure (jobs, memmgr)
 * Add debug support

I hope that helps in reviews.

> I'm all for reusing your code. My concern is that the structure of this
> is quite different from what can be found in the L4T downstream kernels
> and therefore some rethinking may be required.

As long as I can keep nvhost as a separate entity, I can port changes
from upstream to downstream and vice versa and there's no architectural
reason why we couldn't gradually move in downstream kernel to using
tegradrm.

If we merge host1x management code to tegradrm, there's no logical way
of taking tegradrm into use in downstream.

Terje
