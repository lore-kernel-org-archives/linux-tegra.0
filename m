From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC v2 1/8] video: tegra: Add nvhost driver
Date: Thu, 29 Nov 2012 11:38:11 -0700
Message-ID: <50B7AB93.5060207@wwwdotorg.org>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com> <1353935954-13763-2-git-send-email-tbergstrom@nvidia.com> <20121128212301.GA25531@avionic-0098.adnet.avionic-design.de> <50B73710.2040102@nvidia.com> <20121129114704.GB6150@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121129114704.GB6150-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/29/2012 04:47 AM, Thierry Reding wrote:
> On Thu, Nov 29, 2012 at 12:21:04PM +0200, Terje Bergstr=C3=B6m wrote:
>> On 28.11.2012 23:23, Thierry Reding wrote:
>>> This could be problematic. Since drivers/video and
>>> drivers/gpu/drm are separate trees, this would entail a
>>> continuous burden on keeping both trees synchronized. While I
>>> realize that eventually it might be better to put the host1x
>>> driver in a separate place to accomodate for its use by other
>>> subsystems, I'm not sure moving it here right away is the best=20
>>> approach.
>>=20
>> I understand your point, but I hope also that we'd end up with
>> something that can be used as basis for the downstream kernel to
>> migrate to upstream stack.
>>=20
>> The key point here is to make the API between nvhost and tegradrm
>> as small and robust to changes as possible.
>=20
> I agree. But I also fear that there will be changes eventually and=20
> having both go in via different tree requires those trees to be
> merged in a specific order to avoid breakage should the API change.
> This will be particularly ugly in linux-next.
>=20
> That's why I explicitly proposed to take this into
> drivers/gpu/drm/tegra for the time being, until we can be
> reasonably sure that the API is fixed. Then I'm fine with moving it
> wherever seems the best fit. Even then there might be the
> occasional dependency, but they should get fewer and fewer as the
> code matures.

It is acceptable for one maintainer to ack patches, and another
maintainer to merge a series that touches both "their own" code and
code owned by another tree. This should of course only be needed when
inter-module APIs change; changes to code within a module shouldn't
require this.
