From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Jetson TX2 and serial console
Date: Mon, 12 Feb 2018 08:20:53 +0000
Message-ID: <4e6b2e2a-af20-3bf3-149c-497584b17212@nvidia.com>
References: <CAFCWPPKe6LW1+Uu40tGz4jzYwHY6MvU2D79HauWxRHOentVq3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAFCWPPKe6LW1+Uu40tGz4jzYwHY6MvU2D79HauWxRHOentVq3A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?Q?Milan_Bu=c5=a1ka?= <milan.buska-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 09/02/18 18:41, Milan Buška wrote:
> Hi Jon,
> 
> Is there any way to control tx2 via the serial interface?
> Every time I run the minicom, it stops before the bash prompt.
> I mean to communicate with tx2 with the computer on which the minicom runs.

Yes that should work. I always use the serial interface. What userspace
are you using? If you are using the L4T userspace it should work.

Jon

-- 
nvpublic
