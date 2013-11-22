From: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] ARM: tegra: switch FUSE clock on before usage
Date: Fri, 22 Nov 2013 10:35:42 +0900
Message-ID: <528EB4EE.309@nvidia.com>
References: <1385001613-19098-1-git-send-email-acourbot@nvidia.com> <528E6D58.6050503@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <528E6D58.6050503-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/22/2013 05:30 AM, Stephen Warren wrote:
> On 11/20/2013 07:40 PM, Alexandre Courbot wrote:
>> FUSE clock is enabled by most bootloaders, but we cannot expect it to be
>> on in all contexts (e.g. kexec).
>>
>> Ensure the FUSE clock is enabled before any of its registers is touched.
>> Since FUSE is touched very early during system boot (before the clock
>> devices are registered), directly manipulate the clock register bit in
>> case the clock device cannot be acquired.
>
> This looks reasonable to me. I'll apply it soon after -rc1.

Thanks. Be careful as I noticed I misformatted my commit message. The 
part after the "--" will not be stripped by git am as I intended it to 
be. I understood what I did wrong and will hopefully not make that 
mistake again.

Sorry for the inconvenience.
