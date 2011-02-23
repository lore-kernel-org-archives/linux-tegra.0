From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 5/7] ARM: tegra: timer: Enable timer and rtc clocks
Date: Wed, 23 Feb 2011 09:39:27 -0800
Message-ID: <AANLkTikiLwofnVB=f54MdqjAmrT2EvSxRryw3J7Jd5oC@mail.gmail.com>
References: <1298342392-21236-1-git-send-email-ccross@android.com>
	<1298342392-21236-6-git-send-email-ccross@android.com>
	<20110222205634.GF29559@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110222205634.GF29559-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 22, 2011 at 12:56 PM, Russell King - ARM Linux
<linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:
> On Mon, Feb 21, 2011 at 06:39:50PM -0800, Colin Cross wrote:
>> + =A0 =A0 struct clk *clk;
>> =A0 =A0 =A0 unsigned long rate =3D clk_measure_input_freq();
>> =A0 =A0 =A0 int ret;
>>
>> + =A0 =A0 clk =3D clk_get_sys("timer", NULL);
>> + =A0 =A0 BUG_ON(IS_ERR(clk));
>> + =A0 =A0 clk_enable(clk);
>> + =A0 =A0 clk_put(clk);
>> +
>> + =A0 =A0 clk =3D clk_get_sys("rtc-tegra", NULL);
>> + =A0 =A0 BUG_ON(IS_ERR(clk));
>> + =A0 =A0 clk_enable(clk);
>> + =A0 =A0 clk_put(clk);
>
> It's probably better to leave them get'd if you're continuing to use
> them and just forget the reference.
>

Good point, fixed.
--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" =
in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
