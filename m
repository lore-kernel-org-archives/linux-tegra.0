From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC 6/6] bus: Add support for Tegra NOR controller
Date: Mon, 25 Jul 2016 09:19:12 +0100
Message-ID: <7f558131-60c7-22e2-2b2e-93d4b405a2db@nvidia.com>
References: <1468935397-11926-1-git-send-email-mirza.krak@gmail.com>
 <1468935397-11926-7-git-send-email-mirza.krak@gmail.com>
 <f6df33eb-53ae-699b-9e1f-69eb7fed7da0@nvidia.com>
 <CALw8SCVy4ud5_+gS3C8WeyTCV0m_4R2xjdEY4vCKEq_3-aFanw@mail.gmail.com>
 <dbbb5c9f-8c67-9d9f-171b-64cd18353411@nvidia.com>
 <CALw8SCXCdVMKgemEyQ-MZbxdthkPCDVzi+3boqtXk1_XNjcz4g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALw8SCXCdVMKgemEyQ-MZbxdthkPCDVzi+3boqtXk1_XNjcz4g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mirza Krak <mirza.krak-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 22/07/16 20:18, Mirza Krak wrote:
> 2016-07-22 11:38 GMT+02:00 Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>:
>>>> The driver should have a remove function given that we can build as a
>>>> module.
>>>
>>> At the moment I do not know what we would do in a remove function and
>>> hence me not adding one.
>>
>> Should just be the inverse of the probe (although there is no inverse
>> for the parsing DT bit). If you don't wish to add a remove, that is
>> fine, but make the driver a 'bool' and not 'tristate' in the Kconfig so
>> it cannot be configured as a module.
> 
> I understand the concept of a remove function, but I use devm_ calls
> for all resources. These should be handled by the device core on a
> driver detach?

There is one clock that needs to be disabled in the remove.

Cheers
Jon

-- 
nvpublic
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
