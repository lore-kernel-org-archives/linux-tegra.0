From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH] ARM: tegra: Fix restoration of PLLM when exiting suspend
Date: Wed, 11 Dec 2019 10:50:16 +0200
Message-ID: <20191211085016.GW28289@pdeschrijver-desktop.Nvidia.com>
References: <20191210103708.7023-1-jonathanh@nvidia.com>
 <1f2a4f23-5be5-aa7e-6eb4-2aeb4058481d@gmail.com>
 <1fe9cd2d-50a2-aae5-95fa-0329acce4c4c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1fe9cd2d-50a2-aae5-95fa-0329acce4c4c@gmail.com>
Sender: stable-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, stable@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Dec 10, 2019 at 11:29:42PM +0300, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>=20
>=20
> 10.12.2019 22:28, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > Hello Jon,
> >
> > PLLM's enable-status could be defined either by PMC or CaR. Thus at
> > first you need to check whether PMC overrides CaR's enable and then
> > judge the enable state based on PMC or CaR state respectively.
> >
>=20
> Actually, now I think that it doesn't make sense to check PMC WB0 state
> at all. IIUC, PLLM's state of the WB0 register defines whether Boot ROM
> should enable PLLM on resume from suspend. Thus it will be correct to
> check only the CaR's enable-state of PLLM.
>=20
> I'm not sure what's the idea of WB0 overriding, maybe to resume faster.
> Peter, could you please clarify that?

I don't know why these overriding bits exist. The code for them was in
the downstream driver so I implemented the same in the upstream driver
:)

Peter.
