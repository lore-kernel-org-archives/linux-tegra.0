From: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2] ARM: tegra: switch FUSE clock on before usage
Date: Wed, 4 Dec 2013 16:09:13 +0900
Message-ID: <CAAVeFuJpHXCANRO=AT5mKGpHzJRpmQoOuX4hjsctEMMAMjgqnQ@mail.gmail.com>
References: <1385001613-19098-1-git-send-email-acourbot@nvidia.com>
 <528E6D58.6050503@wwwdotorg.org> <528EB4EE.309@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <528EB4EE.309-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

On Fri, Nov 22, 2013 at 10:35 AM, Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> On 11/22/2013 05:30 AM, Stephen Warren wrote:
>>
>> On 11/20/2013 07:40 PM, Alexandre Courbot wrote:
>>>
>>> FUSE clock is enabled by most bootloaders, but we cannot expect it to be
>>> on in all contexts (e.g. kexec).
>>>
>>> Ensure the FUSE clock is enabled before any of its registers is touched.
>>> Since FUSE is touched very early during system boot (before the clock
>>> devices are registered), directly manipulate the clock register bit in
>>> case the clock device cannot be acquired.
>>
>>
>> This looks reasonable to me. I'll apply it soon after -rc1.
>
>
> Thanks. Be careful as I noticed I misformatted my commit message. The part
> after the "--" will not be stripped by git am as I intended it to be. I
> understood what I did wrong and will hopefully not make that mistake again.
>
> Sorry for the inconvenience.

I am not seeing this in your tree, have you applied it somewhere already?
