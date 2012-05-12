From: Bernd Petrovitsch <bernd-JY8rjfDgnXcb9sJ47jD7nuTv7YV0F9Eg@public.gmane.org>
Subject: Re: [RFC 1/1] driver core: Add dev_*_ratelimited() family
Date: Sat, 12 May 2012 13:32:03 +0200
Message-ID: <1336822324.14918.9.camel@thorin>
References: <20120512.135227.1196366807162247040.hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120512.135227.1196366807162247040.hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi!

On Sam, 2012-05-12 at 12:52 +0200, Hiroshi Doyu wrote:
[...]
> An unclosed "if" statement in the MACRO seems a bit risky, but I don't
> have any better/simple solution for this, ATM. Is there any alternative?

No, the "do { ... } while (0)" is actually the only one and widely used
- not only in the Linux kernel.

[....]

	Bernd
-- 
Bernd Petrovitsch                  Email : bernd-JY8rjfDgnXcb9sJ47jD7nuTv7YV0F9Eg@public.gmane.org
                     LUGA : http://www.luga.at
