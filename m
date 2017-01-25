From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 5/6] ARM: tegra: nyan-big: Proper pinmux for TPM i2c
Date: Wed, 25 Jan 2017 11:10:56 +0000
Message-ID: <2710b1a1-eab5-0a0d-657f-e6bc9b5cefaa@nvidia.com>
References: <20170122154753.31942-1-contact@paulk.fr>
 <20170122154753.31942-5-contact@paulk.fr> <20170125110644.GF9344@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170125110644.GF9344-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>, Peter Rosin <peda-koto5C5qi+TLoDKTGw+V6w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


On 25/01/17 11:06, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Sun, Jan 22, 2017 at 04:47:52PM +0100, Paul Kocialkowski wrote:
>> This corrects the pinmux for accessing the TPM over the i2c line.
>> Thus, it allows correctly probing the module, that previously failed with i2c
>> errors.
>>
>> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
>> ---
>>  arch/arm/boot/dts/tegra124-nyan-big.dts | 20 ++++++++++----------
>>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> I've applied an s/i2c/I2C/ in the commit message and applied this. Can
> you also make sure that these changes go into the nyan-big configuration
> of the tegra-pinmux-scripts[0]? I know Stephen wants to keep those in
> sync with the DTS.
> 
> Thanks,
> Thierry
> 
> [0]: https://github.com/NVIDIA/tegra-pinmux-scripts

Looks like it has already been changed ...

https://github.com/NVIDIA/tegra-pinmux-scripts/commit/5049f75b3099515ffb7f064dcf23568c17aecb01

Jon

-- 
nvpublic
