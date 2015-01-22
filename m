From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] i2c: tegra: Maintain CPU endianness
Date: Thu, 22 Jan 2015 18:22:57 +0300
Message-ID: <54C115D1.10206@gmail.com>
References: <1421756555-20266-1-git-send-email-digetx@gmail.com> <20150122074001.GB427@ulmo> <CAAVeFuJHST9VOWXe_cZNvLmfGdamuU4HSgdZC6EoQvrsGFt+Fg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAVeFuJHST9VOWXe_cZNvLmfGdamuU4HSgdZC6EoQvrsGFt+Fg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

22.01.2015 10:55, Alexandre Courbot =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On Thu, Jan 22, 2015 at 4:40 PM, Thierry Reding
> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>> Should this not technically be le32_to_cpu() since the data originat=
es
>> from the I2C controller?

No, i2c_readl returns value in CPU endianness, so it's correct. But for=
=20
i2c_writel should be used le32_to_cpu(), since it takes value in CPU en=
dianness.
It's my overlook, V2 is coming.

>>
>> Why does this have to be initialized to 0 now?
>
> I suspect this is because we are going to memcpy less than 4 bytes
> into it, but I cannot figure out how that memcpy if guaranteed to
> produce the expected result for both endiannesses.
>
That's correct. Memcpy is working with bytes, so it doesn't care about=20
endianness and produces expected result, since I2C message is char arra=
y.

--=20
Dmitry
