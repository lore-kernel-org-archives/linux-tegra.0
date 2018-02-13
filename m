From: =?UTF-8?B?TWlsYW4gQnXFoWth?= <milan.buska-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Jetson TX2 and serial console
Date: Tue, 13 Feb 2018 15:46:01 +0100
Message-ID: <CAFCWPPKpi0pkNwtbtCcVjOzaNQDdcBs3zUA819MdefifJfFx7A@mail.gmail.com>
References: <CAFCWPPKe6LW1+Uu40tGz4jzYwHY6MvU2D79HauWxRHOentVq3A@mail.gmail.com>
 <4e6b2e2a-af20-3bf3-149c-497584b17212@nvidia.com> <CAFCWPPLsFit2xL8YCEAV2AQPLSg6C27Jzetw9JvThfwuePUp8g@mail.gmail.com>
 <3718cdb9-d929-44a4-d726-ad3c6bc6b627@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3718cdb9-d929-44a4-d726-ad3c6bc6b627-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Jon,

Thank you for the tip and I wish all developers in their work a lot of succ=
ess.

With respect

Milan


2018-02-13 11:50 GMT+01:00 Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>:
> Hi Milan,
>
> On 12/02/18 17:39, Milan Bu=C5=A1ka wrote:
>> Hi Jon,
>>
>> Use
>> USB to TTL Serial Cable - Debug / Console Cable for Raspberry Pi
>>
>> Jetson TX2 J21 Pin 8 (UART 1 TXD) =E2=86=92 Cable RXD (White Wire)
>> Jetson TX2 J21 Pin 10 (UART 1 RXD) =E2=86=92 Cable TXD (Green Wire)
>> Jetson TX2 J21 Pin 9 (GND) =E2=86=92 Cable GND (Black Wire)
>
> I believe that you want J17. Can you try connecting the debug cable to
> that header?
>
>> Again, I am sorry to be burdening this mailing list with stupid question=
s
>
> Not at all. This is the correct forum for mainline kernel related
> questions. If you have generic Jetson-TX2 or L4T questions then the
> right place is here [0].
>
> Cheers
> Jon
>
> [0] https://devtalk.nvidia.com/default/board/139/jetson-embedded-systems/
>
> --
> nvpublic



--=20
---------------------------------------------------------------------------=
-
Remember, no question is too stupid and no problem
          too small--We've all been beginners
