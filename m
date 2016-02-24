From: Wei Ni <wni@nvidia.com>
Subject: Re: [PATCH v6 08/12] of: add notes of critical trips for soctherm
Date: Wed, 24 Feb 2016 18:21:56 +0800
Message-ID: <56CD8444.3010001@nvidia.com>
References: <1456128650-29104-1-git-send-email-wni@nvidia.com> <20160223213829.GA16577@rob-hp-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160223213829.GA16577@rob-hp-laptop>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: thierry.reding@gmail.com, rui.zhang@intel.com, MLongnecker@nvidia.com, swarren@wwwdotorg.org, mikko.perttunen@kapsi.fi, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 2016=E5=B9=B402=E6=9C=8824=E6=97=A5 05:38, Rob Herring wrote:
> On Mon, Feb 22, 2016 at 04:10:50PM +0800, Wei Ni wrote:
>> The "ctirical" type trip in thermal zone can be
>=20
> typo

Hmm, will fix it.

>=20
>> set to SOC_THERM hardware, it can trigger shut down
>> or reset event from hardware.
>>
>> Signed-off-by: Wei Ni <wni@nvidia.com>
>> ---
>>  Documentation/devicetree/bindings/thermal/tegra-soctherm.txt | 12 +=
+++++++++++
>>  1 file changed, 12 insertions(+)
>=20
> Otherwise,
>=20
> Acked-by: Rob Herring <robh@kernel.org>

Sure, will do it.

>=20
