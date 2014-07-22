From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [GIT PULL 2/3] ARM: tegra: move fuse code out of arch/arm
Date: Tue, 22 Jul 2014 10:27:25 -0600
Message-ID: <53CE90ED.8030900@wwwdotorg.org>
References: <1403558626-13422-2-git-send-email-swarren@wwwdotorg.org> <20140707004417.GE8469@quad.lixom.net> <20140708134359.GA23218@tbergstrom-lnx.Nvidia.com> <CAOesGMhoqvqf-dktp-OfUNTPLahPwkyAPiTeDngr4QjH=VfOGA@mail.gmail.com> <53C88A4C.3070304@wwwdotorg.org> <CAOesGMh+zLV781wzdR5=_Bpzh+XMwJfWL-5XMDP6DwG_Hg80kw@mail.gmail.com> <53CD2C58.6060601@wwwdotorg.org> <20140721155451.GF32578@arm.com> <53CD4201.5070705@wwwdotorg.org> <CAOesGMgvd1HbjywN7BDPtr8ZU7vucWH48B=AW3TZjng73YA8WA@mail.gmail.com> <20140722102749.GB2219@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20140722102749.GB2219-5wv7dgnIgG8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: "paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org" <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/22/2014 04:27 AM, Catalin Marinas wrote:
...
> ...It's also aimed at
> pushing back on hardware people who think they can mess up, for example,
> a GIC implementation because the rest is just software and you can
> always add #ifdefs.

I'm very concerned about this statement.

Yes, it would be nice if all HW was sanely designed, but it's not
always. The time to push back on bad HW design is during IP licensing
agreements or HW design reviews, not upstreaming.

Any pushback during SW upstreaming simply serves to make it difficult
for the SW people doing the upstreaming. It has zero impact on the
current HW design (it's already shipped). It probably has zero impact on
the next N revisions of the HW (they're already baked). It's possible it
has zero-to-minimal impact on any future HW (end-user product
requirements are what matter most).
