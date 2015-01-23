From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] i2c: tegra: Maintain CPU endianness
Date: Fri, 23 Jan 2015 17:52:10 +0300
Message-ID: <54C2601A.7000005@gmail.com>
References: <1421756555-20266-1-git-send-email-digetx@gmail.com> <20150122074001.GB427@ulmo> <CAAVeFuJHST9VOWXe_cZNvLmfGdamuU4HSgdZC6EoQvrsGFt+Fg@mail.gmail.com> <54C115D1.10206@gmail.com> <54C12010.8040504@gmail.com> <54C130EA.2050505@gmail.com> <20150123094552.GD3835@ulmo> <54C24C2B.1070907@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54C24C2B.1070907-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

23.01.2015 16:27, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> 23.01.2015 12:45, Thierry Reding =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On Thu, Jan 22, 2015 at 08:18:34PM +0300, Dmitry Osipenko wrote:
>>> 22.01.2015 19:06, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> 22.01.2015 18:22, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>>> 22.01.2015 10:55, Alexandre Courbot =D0=BF=D0=B8=D1=88=D0=B5=D1=82=
:
>>>>>> On Thu, Jan 22, 2015 at 4:40 PM, Thierry Reding
>>>>>> <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>>>>>>
>>>>>>> Should this not technically be le32_to_cpu() since the data ori=
ginates
>>>>>> >from the I2C controller?
>>>>>
>>>>> No, i2c_readl returns value in CPU endianness, so it's correct. B=
ut for
>>>>> i2c_writel should be used le32_to_cpu(), since it takes value in =
CPU
>>>>> endianness.
>>>>> It's my overlook, V2 is coming.
>>>>>
>>>>>>>
>>>>>>> Why does this have to be initialized to 0 now?
>>>>>>
>>>>>> I suspect this is because we are going to memcpy less than 4 byt=
es
>>>>>> into it, but I cannot figure out how that memcpy if guaranteed t=
o
>>>>>> produce the expected result for both endiannesses.
>>>>>>
>>>>> That's correct. Memcpy is working with bytes, so it doesn't care =
about
>>>>> endianness and produces expected result, since I2C message is cha=
r array.
>>>>>
>>>> I'll spend some more time reviewing, to see if nullifying should g=
o as separate
>>>> patch.
>>>>
>>> Well, I2C_FIFO_STATUS returns 8-bit value. The rest of bits very li=
kely to
>>> be RAZ, however I don't see anything on it in documentation. In tha=
t case it
>>> won't cause any problems with LE value and nullifying is only neede=
d for BE
>>> mode.
>>
>> What does I2C_FIFO_STATUS have to do with anything?
>>
>> My point was more that we already tell hardware how much data is to =
be
>> transferred (via the packet header in tegra_i2c_xfer_msg()), hence t=
he
>> hardware shouldn't care whether the FIFO is padded with random data =
or
>> zeros.
>>
>> Thierry
>>
> Got your point. I was thinking it's expected behavior, but now I'll e=
laborate
> this more.
>
Gaahh! I'm sure it wasn't working before! I'll make more testing and se=
nd v3=20
without "val =3D 0", if all will be fine.

--=20
Dmitry
