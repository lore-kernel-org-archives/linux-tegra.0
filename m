From: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RESEND PATCH 2/2] ARM: dts: tegra: Use labels for overriding
 nodes in Tegra114 boards
Date: Wed, 20 May 2015 14:03:40 +0900
Message-ID: <CAJKOXPeDSOwRU4Btt97Tf6Qd1zj5ctVnL_3-_RWGSy004SAACA@mail.gmail.com>
References: <1432036279-6318-1-git-send-email-k.kozlowski.k@gmail.com>
	<1432036279-6318-2-git-send-email-k.kozlowski.k@gmail.com>
	<CAAVeFu+-EYwZ9veNK8T6ZTc9tV0ZgGGm4M6vsiXe70TGTvfOzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAVeFu+-EYwZ9veNK8T6ZTc9tV0ZgGGm4M6vsiXe70TGTvfOzA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

2015-05-20 13:05 GMT+09:00 Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> On Tue, May 19, 2015 at 8:51 PM, Krzysztof Kozlowski
> <k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>> Usage of labels instead of full paths reduces possible mistakes when
>> overriding nodes.
>>
>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> Indentation seems to be off by one tab in the added code (hence the
> huge size of this patch ; most lines should not change), can you
> check?

It is correct. This change in indentation is an effect of moving nodes
out of first bracket ("\ {"). That is the convention.

It us up to you guys if this is worth the effort. For exynos we use
label-convention and now I am converting old DTS to it. I think the
label-convention is less error-prone when extending or overriding
nodes. Also it removes duplicated addresses.

Best regards,
Krzysztof
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
