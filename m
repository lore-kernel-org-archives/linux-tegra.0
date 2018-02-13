From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Jetson TX2 and serial console
Date: Tue, 13 Feb 2018 10:50:35 +0000
Message-ID: <3718cdb9-d929-44a4-d726-ad3c6bc6b627@nvidia.com>
References: <CAFCWPPKe6LW1+Uu40tGz4jzYwHY6MvU2D79HauWxRHOentVq3A@mail.gmail.com>
 <4e6b2e2a-af20-3bf3-149c-497584b17212@nvidia.com>
 <CAFCWPPLsFit2xL8YCEAV2AQPLSg6C27Jzetw9JvThfwuePUp8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFCWPPLsFit2xL8YCEAV2AQPLSg6C27Jzetw9JvThfwuePUp8g-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Milan_Bu=c5=a1ka?= <milan.buska-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Milan,

On 12/02/18 17:39, Milan Buška wrote:
> Hi Jon,
> 
> Use
> USB to TTL Serial Cable - Debug / Console Cable for Raspberry Pi
> 
> Jetson TX2 J21 Pin 8 (UART 1 TXD) → Cable RXD (White Wire)
> Jetson TX2 J21 Pin 10 (UART 1 RXD) → Cable TXD (Green Wire)
> Jetson TX2 J21 Pin 9 (GND) → Cable GND (Black Wire)

I believe that you want J17. Can you try connecting the debug cable to
that header?

> Again, I am sorry to be burdening this mailing list with stupid questions

Not at all. This is the correct forum for mainline kernel related
questions. If you have generic Jetson-TX2 or L4T questions then the
right place is here [0].

Cheers
Jon

[0] https://devtalk.nvidia.com/default/board/139/jetson-embedded-systems/

-- 
nvpublic
