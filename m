From: Nagarjuna Kristam <nkristam@nvidia.com>
Subject: Re: [PATCH V1 0/8] Tegra XUSB charger detect support
Date: Mon, 30 Mar 2020 14:16:42 +0530
Message-ID: <48fde9ce-7d40-c2c3-1a9c-994654a02367@nvidia.com>
References: <1584527467-8058-1-git-send-email-nkristam@nvidia.com>
 <87pncve963.fsf@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <87pncve963.fsf@kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Felipe Balbi <balbi@kernel.org>, kishon@ti.com, robh+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, jckuo@nvidia.com
List-Id: linux-tegra@vger.kernel.org



On 29-03-2020 16:10, Felipe Balbi wrote:
>> This patch series adds charger detect support on XUSB hardware used in
>> Tegra210 and Tegra186 SoCs.
>>
>> This patchset is composed with :
>>   - dt bindings of XUSB Pad Controller
>>   - Tegra XUSB device mode driver to add vbus_draw support
>>   - Tegra PHY driver for charger detect support
>>
>> Tests done:
>>   - Connect USB cable from ubuntu host to micro-B port of DUT to detect
>>     SDP_TYPE charger
>>   - Connect USB cable from external powered USB hub(which inturn connects
>>     to ubuntu host) to micro-B port of DUT to detect CDP_TYPE charger.
>>   - Connect USB cable from USB charger to micro-B port of DUT to detect
>>     DCP_TYPE charger.
>> DUT: Jetson-tx1, Jetson tx2.
>>
>> Nagarjuna Kristam (8):
>>    dt-bindings: phy: tegra-xusb: Add charger-detect property
>>    usb: gadget: tegra-xudc: Add vbus_draw support
>>    phy: tegra: xusb: Add support for UTMI pad power control
>>    phy: tegra: xusb: Add USB2 pad power control support for Tegra210
>>    phy: tegra: xusb: Add soc ops API to enable UTMI PAD protection
>>    phy: tegra: xusb: Add support for charger detect
>>    phy: tegra: xusb: Enable charger detect for Tegra186
>>    phy: tegra: xusb: Enable charger detect for Tegra210
> this doesn't apply cleanly. Could you resend after -rc1 is tagged?
> 
> -- balbi

Sure, will send rebased patch once rc1 is available.

Thanks,
Nagarjuna
