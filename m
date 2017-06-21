From: jeffy <jeffy.chen@rock-chips.com>
Subject: Re: [RFC PATCH v3 3/6] ARM/arm64: dts: enable wakeup for cros-ec-spi
 devices
Date: Wed, 21 Jun 2017 23:33:29 +0800
Message-ID: <594A91C9.1090906@rock-chips.com>
References: <1498039313-24220-1-git-send-email-jeffy.chen@rock-chips.com>
 <1498039313-24220-4-git-send-email-jeffy.chen@rock-chips.com>
 <CAJKOXPdL2CB9VWNo=it0dos-4hJYrgHUSZwcG1DS=9c+YxXzhQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <CAJKOXPdL2CB9VWNo=it0dos-4hJYrgHUSZwcG1DS=9c+YxXzhQ@mail.gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, dmitry.torokhov@gmail.com, Heiko Stuebner <heiko@sntech.de>, linux-rockchip@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>, briannorris@chromium.org, Will Deacon <will.deacon@arm.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, dianders@chromium.org, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Jonathan Hunter <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Hi Krzysztof,

thanx for your comment.

On 06/21/2017 06:45 PM, Krzysztof Kozlowski wrote:
> On Wed, Jun 21, 2017 at 12:01 PM, Jeffy Chen <jeffy.chen@rock-chips.com> wrote:
>> We used to enable wakeup for cros-ec-spi devices unconditionally.
>> Now we are using the more generic wakeup-source property to enable it.
>
> Using wakeup-source property is still enabling this unconditionally.
> What  do you exactly mean here?
i mean the wakeup-source is an optional property, we can disable wakeup 
by not adding it.

but now i enable it to all exist cros-ec-spi devices for not breaking 
current stuffs :)
>
>>
>> Signed-off-by: Jeffy Chen <jeffy.chen@rock-chips.com>
>> ---
>>
>> Changes in v3: None
>>
>>   arch/arm/boot/dts/exynos5420-peach-pit.dts      | 1 +
>>   arch/arm/boot/dts/exynos5800-peach-pi.dts       | 1 +
>>   arch/arm/boot/dts/rk3288-veyron-chromebook.dtsi | 1 +
>>   arch/arm/boot/dts/tegra124-nyan.dtsi            | 1 +
>>   arch/arm/boot/dts/tegra124-venice2.dts          | 1 +
>>   arch/arm64/boot/dts/nvidia/tegra132-norrin.dts  | 1 +
>>   arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi    | 1 +
>>   7 files changed, 7 insertions(+)
>
> Please split it per arch (arm and arm64) and per machine. I'll take
> exynos after splitting.
ok, sounds good, will do it in next version, thanx~
>
> Best regards,
> Krzysztof
>
>
>
