From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V5 3/5] i2c: tegra: Add DMA Support
Date: Wed, 30 Jan 2019 07:49:51 +0300
Message-ID: <20190130074951.154cf037@dimatab>
References: <1548803771-13424-1-git-send-email-skomatineni@nvidia.com>
        <1548803771-13424-3-git-send-email-skomatineni@nvidia.com>
        <20190130044214.65991195@dimatab>
        <BYAPR12MB339850895826781B4E6AF028C2900@BYAPR12MB3398.namprd12.prod.outlook.com>
        <BYAPR12MB339812A2E876B76E95828EA1C2900@BYAPR12MB3398.namprd12.prod.outlook.com>
        <BYAPR12MB3398502D8F00D4F7BFF25D27C2900@BYAPR12MB3398.namprd12.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <BYAPR12MB3398502D8F00D4F7BFF25D27C2900@BYAPR12MB3398.namprd12.prod.outlook.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Mantravadi Karthik <mkarthik@nvidia.com>, Shardar Mohammed <smohammed@nvidia.com>, Timo Alho <talho@nvidia.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

=D0=92 Wed, 30 Jan 2019 04:22:10 +0000
Sowjanya Komatineni <skomatineni@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> [Correction]
>=20
> > > Could you please tell whether you missed my comments to V3 [0] or
> > > chose to ignore them? If the former, then I'd want to get answers
> > > to those questions and comments. I'll stop here for now.
> > >=20
> > > [0] https://patchwork.ozlabs.org/patch/1031379/ =20
> >
> > Somehow missed those from multiple comments. Will go thru and
> > respond back. =20
>=20
> V6 includes feedback changes. Want to clarify on few feedback points
>=20
> - ALIGN is used for 4 byte boundary to use with DMA but extra bytes
> doesn=E2=80=99t get transferred over I2C as I2C controller transfer bytes
> based on size specified in the packet header. DMA length and memory
> address need to be 4 byte boundary.

Okay, I see now. Thanks.

> - RX channel releasing when TX init fails?
>   For I2C both TX and RX doesn=E2=80=99t happen in same transaction and no
> dependency. So if RX channel request & buffer allocation succeeds but
> TX channel request fails, then RX DMA can still be used for Msg reads
> and transmits can happen on PIO mode

That's not what my point is about. In a case of TX initing failure, the
RX channel and DMA buffer are not getting released in the probe
function. Please be more careful about managing allocated resources.

> - dma_burst < 8 negatively affects transfer efficiency? Performance
> stats for DMA Vs PIO mode. Tested with 256 bytes of transfer and DMA
> Vs PIO mode transfer rate is almost same. But the main reason for
> adding DMA mode is to address couple of cases mentioned earlier and
> not mainly from the transfer performance perspective.=20

Could you please add a clarifying comment to the code, saying that the
whole purpose of the DMA transfer is solely to avoid delaying of the
transactions?

Thanks for the replies! I'll take a look at V6 later today.
