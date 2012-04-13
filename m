From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH V2 4/5] ARM: dt: tegra30.dtsi: Add
	audio-related nodes
Date: Fri, 13 Apr 2012 13:59:29 -0700
Message-ID: <CAOesGMiVPLRMo6OnLpr0wk4VPPVcgjqbsi3T=D5zHGb1EYrmYw@mail.gmail.com>
References: <1334099980-19527-1-git-send-email-swarren@wwwdotorg.org>
	<1334099980-19527-4-git-send-email-swarren@wwwdotorg.org>
	<CAOesGMhDDenRK_GeR=jWJbcoacRMUPnjFu5w4DCyUWC=CadnbA@mail.gmail.com>
	<4F851673.6030000@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <alsa-devel-bounces@alsa-project.org>
In-Reply-To: <4F851673.6030000@wwwdotorg.org>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
	<mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Sender: alsa-devel-bounces@alsa-project.org
Errors-To: alsa-devel-bounces@alsa-project.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: alsa-devel@alsa-project.org, Stephen Warren <swarren@nvidia.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Colin Cross <ccross@android.com>, linux-tegra@vger.kernel.org, Liam Girdwood <lrg@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 10, 2012 at 10:28 PM, Stephen Warren <swarren@wwwdotorg.org> wr=
ote:
> On 04/10/2012 10:27 PM, Olof Johansson wrote:
> ...
>> On Tue, Apr 10, 2012 at 4:19 PM, Stephen Warren <swarren@wwwdotorg.org> =
wrote:
>>> From: Stephen Warren <swarren@nvidia.com>
>>>
>>> Add nodes for the Tegra30 AHUB and I2S controllers.
> ...
>>> diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30=
.dtsi
> ...
>>> + =A0 =A0 =A0 ahub@70080000 {
>>
>> No need for unit address here since there's only one node with this
>> name -- "ahub {" =A0is sufficient.
>
> Is there actually a benefit from leaving it out though?

Just like there's no benefit from including it. :)

So, either way is OK but I think we're a little too eager to always
include them on ARM compared to what powerpc does. No big deal though.
>
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "nvidia,tegra30-ahub";
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x70080000 0x200 0x70080200 0x10=
0>;
>>
>> Why not just use 0x70080000 0x300?
>
> The register space is logically divided into two chunks; the first for
> the DMA FIFOs and the second for the AHUB routing registers. Future
> chips may change the relative positions and sizes of these two chunks,
> hence I figured it was best to model them independently even though
> they're contiguous in Tegra30.

Makes perfect sense, thanks for the motivation.


-Olof
