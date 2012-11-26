From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/6] video: tegra: Add nvhost driver
Date: Mon, 26 Nov 2012 15:42:29 +0200
Message-ID: <50B371C5.2000608@nvidia.com>
References: <1353577684-7896-1-git-send-email-tbergstrom@nvidia.com> <1353577684-7896-2-git-send-email-tbergstrom@nvidia.com> <20121123233855.GD21555@avionic-0098.adnet.avionic-design.de> <50B07084.40707@nvidia.com> <20121124190416.GC26154@avionic-0098.adnet.avionic-design.de> <50B32690.7020102@nvidia.com> <20121126092524.GB8602@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121126092524.GB8602-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 26.11.2012 11:25, Thierry Reding wrote:
> On Mon, Nov 26, 2012 at 10:21:36AM +0200, Terje Bergstr=C3=B6m wrote:
>> I staged nvhost into 4 patches that each add some functionality:
>>  * Add driver with API to read and increment sync point values
>>  * Add syncpt wait and interrupt infrastructure
>>  * Add channel and client support and related infrastructure (jobs, =
memmgr)
>>  * Add debug support
>>
>> I hope that helps in reviews.
> Sounds better.

Done now, and patches sent. Let me know if you believe the patches
should still be divided.

Best regards,
Terje
