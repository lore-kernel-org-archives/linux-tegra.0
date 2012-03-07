From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v4 5/9] tegra: i2c: Add I2C driver
Date: Tue, 6 Mar 2012 20:46:57 -0800
Message-ID: <CAPnjgZ0=6VUXvHbAFFeJU8OEM=jaOfcCdEykTUb17252ff5Wcg@mail.gmail.com>
References: <1330536689-9121-5-git-send-email-sjg@chromium.org>
	<1330536689-9121-6-git-send-email-sjg@chromium.org>
	<4F4E8AE0.6020206@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F4E8AE0.6020206-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>, Tom Warren <TWarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Yen Lin <yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Heiko Schocher <hs-ynQEQJNshbs@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

On Wed, Feb 29, 2012 at 12:30 PM, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> w=
rote:
> On 02/29/2012 10:31 AM, Simon Glass wrote:
>> From: Yen Lin <yelin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> Add basic i2c driver for Tegra2 with 8- and 16-bit address support.
>> The driver requires CONFIG_OF_CONTROL to obtain its configuration
>> from the device tree.
>
> I only quickly scanned this for issues I vaguely recall from previous
> reviews. I think this looks fine now.

OK thanks. I am going to resend to address Mike's comments, but there
isn't anything major there.

Regards,
Simon

>
> --
> nvpublic
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra=
" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
