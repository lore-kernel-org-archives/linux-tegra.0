From: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [Nouveau] [PATCH v2 0/6] Improve GK20A support, introduce GM20B,
 firmware paths
Date: Thu, 25 Jun 2015 09:14:30 +0900
Message-ID: <558B47E6.7040708@nvidia.com>
References: <1435040166-25651-1-git-send-email-acourbot@nvidia.com>
 <CACAvsv75o33C10+5QjVPnjCJyYRrPNXhaHXSkbXK-vBDFXUZqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACAvsv75o33C10+5QjVPnjCJyYRrPNXhaHXSkbXK-vBDFXUZqg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Andy Ritger <aritger-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Aaron Plattner <aplattner-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ken Adams <KAdams-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/25/2015 08:59 AM, Ben Skeggs wrote:
> On 23 June 2015 at 16:16, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> Second version of this patchset. Not many changes since first version - I hope
>> this means the changes are not too controversial.
>>
>> Changes since v1:
>> - Removed lookup for previous FW files in "nouveau/"
>> - Went back to using request_firmware() since we only try to load one file
> Hey Alex,
>
> I've merged this in my tree as-is for the moment, hopefully to go to
> Linus for the next merge window.  If there's any changes from you guys
> on how you want the firmware to be handled, it'd be nice to have those
> made concrete before then :)

Excellent, that will give us a short grace period. Thanks Ben! :)
