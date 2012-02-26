From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [PATCH] gpio: tegra: Fix build issue due to irq_domain rework.
Date: Sun, 26 Feb 2012 13:23:26 -0800
Message-ID: <CAOesGMg6w+bQVhAyEKCsT1SMGVFEmnaOvvchqzVKzF2XJhCnYg@mail.gmail.com>
References: <1329175275-19404-1-git-send-email-swarren@nvidia.com>
	<74CDBE0F657A3D45AFBB94109FB122FF17BD8BCE0C@HQMAIL01.nvidia.com>
	<20120224232942.GL25293@ponder.secretlab.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120224232942.GL25293-e0URQFbLeQY2iJbIjFUEsiwD8/FfD2ys@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Feb 24, 2012 at 3:29 PM, Grant Likely <grant.likely@secretlab.c=
a> wrote:
> On Fri, Feb 24, 2012 at 03:12:37PM -0800, Stephen Warren wrote:
>> Stephen Warren wrote at Monday, February 13, 2012 4:21 PM:
>> > Commit 7da5a66 "irq_domain: Remove 'new' irq_domain in favour of t=
he
>> > ppc one" changed the set of available irq domain APIs. Update the =
Tegra
>> > GPIO driver to account for those changes, to solve a build break.
>>
>> Grant, Linus,
>>
>> Could this please be checked in; linux-next since about Feb 6th does=
n't
>> build for Tegra without it.
>
> This doesn't apply against the gpio tree since I didn't pick up the D=
T patches.
> It looks like Olof did. =A0(3391811c & 6f74dc9bc). =A0The irq_domain =
branch is
> stable now, so it can be merged into the arm-soc tree before applying=
 this
> patch.

Yep, can do.

Just to clarify, the branch that is guaranteed to be stable is
irqdomain/next on your linux-2.6 repo?


-Olof
