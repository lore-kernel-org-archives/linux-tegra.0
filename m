From: Simon Glass <sjg@chromium.org>
Subject: Re: [PATCH v7 11/20] tegra: fdt: Add clock bindings for
	Tegra2 Seaboard
Date: Tue, 28 Feb 2012 10:51:06 -0800
Message-ID: <CAPnjgZ0ZZQh8g-9W1uLUk+eJUYZDB_D6Bf-D9ec4pgpciEUSOQ@mail.gmail.com>
References: <1330452478-5039-10-git-send-email-sjg@chromium.org>
	<1330452478-5039-12-git-send-email-sjg@chromium.org>
	<74CDBE0F657A3D45AFBB94109FB122FF17BDDF1DC0@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF17BDDF1DC0@HQMAIL01.nvidia.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Stephen Warren <swarren@nvidia.com>
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, U-Boot Mailing List <u-boot@lists.denx.de>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <TWarren@nvidia.com>, Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>
List-Id: linux-tegra@vger.kernel.org

Hi Stephen,

On Tue, Feb 28, 2012 at 10:47 AM, Stephen Warren <swarren@nvidia.com> wrote:
> Simon Glass wrote at Tuesday, February 28, 2012 11:08 AM:
>> Add the definition of the oscillator clock frequency and the 32KHz clock.
>> The latter is provided by a PMIC on I2C which we don't actually use at
>> present, but we expect this definition to be used in the kernel and want
>> to keep our .dts the same.
>>
>> Signed-off-by: Simon Glass <sjg@chromium.org>
>
> Sigh.
>
> I suppose I can ack this, only because it's U-Boot and not the kernel
> so I care a little less about making sure it's correct.
>
> Acked-by: Stephen Warren <swarren@nvidia.com>
>
> Please let it be noted that I do object to:
> * Using an undefined/undocumented binding for the tps6586x.
> * Not including the required properties for #clock-cells in both clock
> =A0nodes, and not including the compatible value in the osc node.

Once you have this in Linux please point me to the commit and I will
do an update.

Re the # issue I will take a look in the next few weeks.

Regards,
Simon

>
> I'm aware that U-Boot's current code-base isn't influenced by these issue=
s,
> but this kind of thing is pretty much on the same level as BIOS vendors
> only caring about Windows working on their HW and not other OSs.
>
> I hope this doesn't come back and bite me, e.g. someone using this as an
> example for kernel work.
>
> --
> nvpublic
>
