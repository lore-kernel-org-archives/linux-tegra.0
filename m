From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v3 09/13] dmaengine: tegra-apb: Remove runtime PM usage
Date: Tue, 7 Jan 2020 18:38:36 +0000
Message-ID: <01660250-0489-870a-6f0e-d74c5041e8e3@nvidia.com>
References: <20200106011708.7463-1-digetx@gmail.com>
 <20200106011708.7463-10-digetx@gmail.com>
 <f63a68cf-bb9d-0e79-23f3-233fc97ca6f9@nvidia.com>
 <fd6215ac-a646-4e13-ee22-e815a69cd099@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <fd6215ac-a646-4e13-ee22-e815a69cd099@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Thierry Reding <thierry.reding@gmail.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 07/01/2020 17:12, Dmitry Osipenko wrote:
> 07.01.2020 18:13, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>> On 06/01/2020 01:17, Dmitry Osipenko wrote:
>>> There is no benefit from runtime PM usage for the APB DMA driver becaus=
e
>>> it enables clock at the time of channel's allocation and thus clock sta=
ys
>>> enabled all the time in practice, secondly there is benefit from manual=
ly
>>> disabled clock because hardware auto-gates it during idle by itself.
>>
>> This assumes that the channel is allocated during a driver
>> initialisation. That may not always be the case. I believe audio is one
>> case where channels are requested at the start of audio playback.
>=20
> At least serial, I2C, SPI and T20 FUSE are permanently keeping channels
> allocated, thus audio is an exception here. I don't think that it's
> practical to assume that there is a real-world use-case where audio
> driver is the only active DMA client.
>=20
> The benefits of gating the DMA clock are also dim, do you have any
> power-consumption numbers that show that it's really worth to care about
> the clock-gating?

No, but at the same time, I really don't see the point in this. In fact,
I think it is a step backwards. If we wanted to only enable clocks while
DMA channels are active we could. So I request you drop this.

Jon

--=20
nvpublic
