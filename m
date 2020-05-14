From: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V3 0/8] Tegra XUSB charger detect support
Date: Thu, 14 May 2020 15:16:48 +0530
Message-ID: <de31ad94-6884-cf83-36c4-0a865bc01753@nvidia.com>
References: <1589437363-16727-1-git-send-email-nkristam@nvidia.com>
 <87wo5e4zzi.fsf@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <87wo5e4zzi.fsf-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 14-05-2020 15:09, Felipe Balbi wrote:
> Nagarjuna Kristam<nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>  writes:
> 
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
>> V3:
>>   - Added ACKed-by details for PHY driver and DT changes.
>>   - Functions and its arguments are aligned.
>>   - Tabs are used for alignment of MACRO's
>>   - For vbus_draw USDC callback, usb_phy set_power error is propogated.
>>   - Fixed various comments given by thierry.
>> V2:
>>   - Added ACKed-by details for DT patches.
>>   - All patches rebased.
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
> Is there a hard-dependency between gadget and phy patches?
> 
> -- balbiNo dependency. They can be merged independently.

- Nagarjuna
