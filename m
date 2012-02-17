From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V1 2/3] Documentation: gpio: Add details of open-drain
 configuration
Date: Fri, 17 Feb 2012 16:00:58 +0530
Message-ID: <4F3E2C62.2040708@nvidia.com>
References: <1329114588-15430-1-git-send-email-ldewangan@nvidia.com>	<1329114588-15430-3-git-send-email-ldewangan@nvidia.com>	<20120213211809.GI11077@ponder.secretlab.ca>	<CACRpkdZzcN5oi0ejeTQn3BNJ_w6XHsBQ_RoQMvpf8Lt2bOARAg@mail.gmail.com>	<4F3CBE3F.1090604@nvidia.com> <CACRpkdaFyxU-gq5ETnNc4LonTo98PbUs09CmvsPUqzyt0Mg2Cg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACRpkdaFyxU-gq5ETnNc4LonTo98PbUs09CmvsPUqzyt0Mg2Cg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "dunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org" <dunlap-/UHa2rfvQTnk1uMJSBkQmQ@public.gmane.org>, "lrg-l0cyMroinI0@public.gmane.org" <lrg-l0cyMroinI0@public.gmane.org>, "broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org" <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 17 February 2012 01:30 AM, Linus Walleij wrote:
> On Thu, Feb 16, 2012 at 9:28 AM, Laxman Dewangan<ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>  wrote:
>
>> Yes, I can add the open source also but like to be in incremental change.
>> Not together with open drain.
>> We can go with:
>> - open drain core driver support.
>> - open drain sysfs interface support
>> - open source core driver support
>> - open source sysfs interface.
>>
>> I have already changes for the first 2 which we can review/apply,
>> Meanwhile I will work on open source support.
>>
>> Does it look good?
> Well as a patch concept it is OK but I have real bad feelings about
> patch  [2/4] and [4/4] adding sysfs.
>
> What the GPIO subsystem really needs is to get rid of sysfs
> interfaces, have them deprecated and replaced with a
> per-gpiochip /dev/gpioN with ioctl()s or similar instead. The sysfs
> interface is just ... it won't scale.
>
Wow, then I will not add 2/4 and 4/4.

> Yours,
> Linus Walleij
