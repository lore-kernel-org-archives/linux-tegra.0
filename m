From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v3 2/2] ARM: dts: tegra20: Add video decoder node
Date: Thu, 12 Oct 2017 14:45:08 +0100
Message-ID: <485a1192-8ef2-5ae1-a45f-d9b7167d8241@nvidia.com>
References: <cover.1507752381.git.digetx@gmail.com>
 <f58be69f6004393711c9ff3cb4b52aed33e2611a.1507752381.git.digetx@gmail.com>
 <0b6150a7-5b2b-ca4d-eb34-b6614e4833df@mentor.com>
 <81f39096-dc66-c98b-50f6-fc81ee1804ec@gmail.com> <20171012132543.GB4453@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <20171012132543.GB4453@ulmo>
Content-Language: en-US
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel/>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: "devel" <driverdev-devel-bounces@linuxdriverproject.org>
To: Thierry Reding <thierry.reding@gmail.com>, Dmitry Osipenko <digetx@gmail.com>
Cc: devel@driverdev.osuosl.org, devicetree@vger.kernel.org, Stephen Warren <swarren@wwwdotorg.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>, linux-tegra@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 12/10/17 14:25, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Thu, Oct 12, 2017 at 03:06:17PM +0300, Dmitry Osipenko wrote:
>> Hello Vladimir,
>>
>> On 12.10.2017 10:43, Vladimir Zapolskiy wrote:
>>> Hello Dmitry,
>>>
>>> On 10/11/2017 11:08 PM, Dmitry Osipenko wrote:
>>>> Add a device node for the video decoder engine found on Tegra20.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>> ---
>>>>  arch/arm/boot/dts/tegra20.dtsi | 17 +++++++++++++++++
>>>>  1 file changed, 17 insertions(+)
>>>>
>>>> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi
>>>> index 7c85f97f72ea..1b5d54b6c0cb 100644
>>>> --- a/arch/arm/boot/dts/tegra20.dtsi
>>>> +++ b/arch/arm/boot/dts/tegra20.dtsi
>>>> @@ -249,6 +249,23 @@
>>>>  		*/
>>>>  	};
>>>>  
>>>> +	vde@6001a000 {
>>>> +		compatible = "nvidia,tegra20-vde";
>>>> +		reg = <0x6001a000 0x3D00    /* VDE registers */
>>>> +		       0x40000400 0x3FC00>; /* IRAM region */
>>>
>>> this notation of a used region in IRAM is non-standard and potentially it
>>> may lead to conflicts for IRAM resource between users.
>>>
>>> My proposal is to add a valid device tree node to describe an IRAM region
>>> firstly, then reserve a subregion in it by using a new "iram" property.
>>>
>>
>> The defined in DT IRAM region used by VDE isn't exactly correct, actually it
>> should be much smaller. I don't know exactly what parts of IRAM VDE uses, for
>> now it is just safer to assign the rest of the IRAM region to VDE.
>>
>> I'm not sure whether it really worthy to use a dynamic allocator for a single
>> static allocation, but maybe it would come handy later.. Stephen / Jon /
>> Thierry, what do you think?
> 
> This sounds like a good idea. I agree that this currently doesn't seem
> to be warranted, but consider what would happen if at some point we have
> more devices requiring access to the IRAM. Spreading individual reg
> properties all across the DT will make it very difficult to ensure they
> don't overlap.
> 
> Presumably the mmio-sram driver will check that pool don't overlap. Or
> even if it doesn't it will make it a lot easier to verify because it's
> all in the same DT node and then consumers only reference it.
> 
> I like Vladimir's proposal. I also suspect that Rob may want us to stick
> to a standardized way referencing such external memory.

FWIW I agree. Seems like a nice approach and describes the h/w accurately.

Cheers
Jon

-- 
nvpublic
