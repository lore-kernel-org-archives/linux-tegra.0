From: Ashish Mhetre <amhetre@nvidia.com>
Subject: Re: [PATCH] scatterlist: Update size type to support greater then 4GB
 size.
Date: Wed, 12 Dec 2018 13:15:15 +0530
Message-ID: <eea4ccbb-a750-581f-525c-ce05d912f537@nvidia.com>
References: <1544595853-18492-1-git-send-email-amhetre@nvidia.com>
 <20181211.222950.1995970751331458343.davem@davemloft.net>
 <5f70fc16-e3cd-37c1-e7ed-e131ad79d387@grimberg.me>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <5f70fc16-e3cd-37c1-e7ed-e131ad79d387@grimberg.me>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sagi Grimberg <sagi@grimberg.me>, David Miller <davem@davemloft.net>
Cc: axboe@kernel.dk, ulf.hansson@linaro.org, herbert@gondor.apana.org.au, mmaddireddy@nvidia.com, Snikam@nvidia.com, adrian.hunter@intel.com, linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, vdumpa@nvidia.com, linux-crypto@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 12/12/18 12:19 PM, Sagi Grimberg wrote:
>=20
>>> =C2=A0 struct nvme_sgl_desc {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __le64=C2=A0=C2=A0=C2=A0 addr;
>>> -=C2=A0=C2=A0=C2=A0 __le32=C2=A0=C2=A0=C2=A0 length;
>>> +=C2=A0=C2=A0=C2=A0 __le64=C2=A0=C2=A0=C2=A0 length;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u8=C2=A0=C2=A0=C2=A0 rsvd[3];
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __u8=C2=A0=C2=A0=C2=A0 type;
>>> =C2=A0 };
>>
>> Isn't this a device or protocol defined datastructure?=C2=A0 You can't j=
ust
>> change it like this.
>=20
> You're correct, we can't...
> [Replied before seeing this issue was already highlighted]
>=20
> The positive side is that it can safely be removed without affecting the
> rest of the patch...

Ohh, I am not aware of this protocol defined data-structures. But it=20
seems that this need not be changed as Sagi is saying sg length for NVME
will never cross 32 bit size.
I'll send a new version removing this change. Thanks.
