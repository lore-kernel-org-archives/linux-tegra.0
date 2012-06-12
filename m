From: Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>
Subject: Re: [PATCH v2 07/10] ARM: tegra: pcie: Add device tree support
Date: Tue, 12 Jun 2012 09:10:54 -1000
Message-ID: <4FD7943E.60302@firmworks.com>
References: <1339427118-32263-1-git-send-email-thierry.reding@avionic-design.de>
 <1339427118-32263-8-git-send-email-thierry.reding@avionic-design.de>
 <4FD66410.7090001@wwwdotorg.org>
 <20120612062124.GE4040@avionic-0098.adnet.avionic-design.de>
 <4FD763C5.3090500@wwwdotorg.org>
 <20120612172041.GA28010@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4878432567581297156=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <20120612172041.GA28010-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This is a multi-part message in MIME format.
--===============4878432567581297156==
Content-Type: multipart/alternative;
 boundary="------------070401020107020807070708"

This is a multi-part message in MIME format.
--------------070401020107020807070708
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/2012 7:20 AM, Thierry Reding wrote:
> * Stephen Warren wrote:
>> On 06/12/2012 12:21 AM, Thierry Reding wrote:
>>> * Stephen Warren wrote:
>>>> On 06/11/2012 09:05 AM, Thierry Reding wrote:
>>>>> This commit adds support for instantiating the Tegra PCIe
>>>>> controller from a device tree.
>>>>
>>>>> +++ b/Documentation/devicetree/bindings/pci/tegra-pcie.txt
>>>>
>>>> Can we please name this nvidia,tegra20-pcie.txt to match the
>>>> naming of all the other Tegra bindings.
>>>
>>> Yes, will do.
>>>
>>>>> +Required properties: +- compatible: "nvidia,tegra20-pcie" +-
>>>>> reg: physical base address and length of the controller's
>>>>> registers
>>>>
>>>> Since there's more than one range now, that should specify how
>>>> many entries are required and what they represent.
>>>
>>> Okay.
>>>
>>>>> +Optional properties: +- pex-clk-supply: supply voltage for
>>>>> internal reference clock +- vdd-supply: power supply for
>>>>> controller (1.05V)
>>>>
>>>> Those shouldn't be optional. If the board has no regulator, the
>>>> board's .dts should provide a fixed always-on regulator that
>>>> those properties can refer to, so that the driver can always
>>>> get() those regulators.
>>>
>>> That'll add more dummy regulators and I don't think sprinkling them
>>> across the DTS is going to work very well. Maybe collecting them
>>> under a top-level "regulators" node is a good option. If you have a
>>> better alternative, I'm all open for it.
>>>
>>>>> diff --git a/arch/arm/boot/dts/tegra20.dtsi
>>>>> b/arch/arm/boot/dts/tegra20.dtsi
>>>>
>>>>> +	pci {
>>>> ...
>>>>> +		status = "disable";
>>>>
>>>> That should be "disabled"; sorry for providing a bad example.
>>>
>>> Yes.
>>>
>>>>> diff --git a/arch/arm/mach-tegra/pcie.c
>>>>> b/arch/arm/mach-tegra/pcie.c
>>>>
>>>>> +static struct tegra_pcie_pdata *tegra_pcie_parse_dt(struct
>>>>> platform_device *pdev)
>>>>
>>>>> +	if (of_find_property(node, "vdd-supply", NULL)) {
>>>>
>>>> As mentioned above, that if statement should be removed, since
>>>> the regulators shouldn't be optional.
>>>
>>> Okay.
>>>
>>>>> +		pcie->vdd_supply = regulator_get(&pdev->dev, "vdd");
>>>>
>>>> Those could be devm_regulator_get(). Then tegra_pcie_remove()
>>>> wouldn't have to put() them.
>>>
>>> Okay.
>>>
>>>>> +	for (i = 0; i<  TEGRA_PCIE_MAX_PORTS; i++) +
>>>>> pdata->enable_ports[i] = true;
>>>>
>>>> Shouldn't the DT indicate which ports are used? I assume there's
>>>> some reason that the existing driver allows that to be
>>>> configured, rather than always enabling all ports. At least,
>>>> enumeration time wasted on non-existent ports springs to mind,
>>>> and perhaps attempting to enable port 1 when port 0 is x4 and
>>>> using all the lanes would cause errors in port 0?
>>>
>>> Yes, that's been on my mind as well. I'm not sure about the best
>>> binding for this. Perhaps something like:
>>>
>>> pci { enable-ports =<0 1 2>; };
>>>
>>> Would do?
>>
>> That seems reasonable, although since the property is presumably
>> something specific to the Tegra PCIe binding, not generic, I think it
>> should be nvidia,enable-ports.
>
> I came up with the following alternative:
>
> 	pci {
> 		compatible = "nvidia,tegra20-pcie";
> 		reg =<0x80003000 0x00000800   /* PADS registers */
> 		       0x80003800 0x00000200   /* AFI registers */
> 		       0x80004000 0x00100000   /* configuration space */
> 		       0x80104000 0x00100000   /* extended configuration space */
> 		       0x80400000 0x00010000   /* downstream I/O */
> 		       0x90000000 0x10000000   /* non-prefetchable memory */
> 		       0xa0000000 0x10000000>; /* prefetchable memory */
> 		interrupts =<0 98 0x04   /* controller interrupt */
> 		              0 99 0x04>; /* MSI interrupt */
> 		status = "disabled";
>
> 		ranges =<0x80000000 0x80000000 0x00002000   /* 2 root ports */
> 			  0x80004000 0x80004000 0x00100000   /* configuration space */
> 			  0x80104000 0x80104000 0x00100000   /* extended configuration space */
> 			  0x80400000 0x80400000 0x00010000   /* downstream I/O */
> 			  0x90000000 0x90000000 0x10000000   /* non-prefetchable memory */
> 			  0xa0000000 0xa0000000 0x10000000>; /* prefetchable memory */
>
> 		#address-cells =<1>;
> 		#size-cells =<1>;
>
> 		port@80000000 {
> 			reg =<0x80000000 0x00001000>;
> 			status = "disabled";
> 		};
>
> 		port@80001000 {
> 			reg =<0x80001000 0x00001000>;
> 			status = "disabled";
> 		};
> 	};
>
> The "ranges" property can probably be cleaned up a bit, but the most
> interesting part is the port@ children, which can simply be enabled in board
> DTS files by setting the status property to "okay". I find that somewhat more
> intuitive to the variant with an "enable-ports" property.
>
> What do you think of this?

The problem is that children of a PCI-ish bus have specific expectations 
about the parent address format - the standard 3-address-cell PCI 
addressing.  So making a PCI bus node - even if it is PCIe - with 1 
address cell is a problem.

Also, if a given address range is listed in "reg", it should not also be 
listed in "ranges".  A block of addresses is either "claimed" by the 
parent node (reg property) or passed through to its children (ranges 
property), but not both.  "reg" entries are appropriate for entities 
that pertain to the overall control of the bus interface itself, while 
"ranges" entries are for chunks of address space that are overlaid onto 
child devices.

>
>
> Thierry
>
>
> _______________________________________________
> devicetree-discuss mailing list
> devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
> https://lists.ozlabs.org/listinfo/devicetree-discuss

--------------070401020107020807070708
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <tt>On 6/12/2012 7:20 AM, Thierry Reding wrote:</tt>
    <blockquote
      cite="mid:20120612172041.GA28010-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org"
      type="cite">
      <pre wrap=""><tt>* Stephen Warren wrote:
</tt></pre>
      <blockquote type="cite">
        <pre wrap=""><tt>On 06/12/2012 12:21 AM, Thierry Reding wrote:
</tt></pre>
        <blockquote type="cite">
          <pre wrap=""><tt>* Stephen Warren wrote:
</tt></pre>
          <blockquote type="cite">
            <pre wrap=""><tt>On 06/11/2012 09:05 AM, Thierry Reding wrote:
</tt></pre>
            <blockquote type="cite">
              <pre wrap=""><tt>This commit adds support for instantiating the Tegra PCIe
controller from a device tree.
</tt></pre>
            </blockquote>
            <pre wrap=""><tt>
</tt></pre>
            <blockquote type="cite">
              <pre wrap=""><tt>+++ b/Documentation/devicetree/bindings/pci/tegra-pcie.txt
</tt></pre>
            </blockquote>
            <pre wrap=""><tt>
Can we please name this nvidia,tegra20-pcie.txt to match the
naming of all the other Tegra bindings.
</tt></pre>
          </blockquote>
          <pre wrap=""><tt>
Yes, will do.

</tt></pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap=""><tt>+Required properties: +- compatible: "nvidia,tegra20-pcie" +-
reg: physical base address and length of the controller's
registers
</tt></pre>
            </blockquote>
            <pre wrap=""><tt>
Since there's more than one range now, that should specify how
many entries are required and what they represent.
</tt></pre>
          </blockquote>
          <pre wrap=""><tt>
Okay.

</tt></pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap=""><tt>+Optional properties: +- pex-clk-supply: supply voltage for
internal reference clock +- vdd-supply: power supply for
controller (1.05V)
</tt></pre>
            </blockquote>
            <pre wrap=""><tt>
Those shouldn't be optional. If the board has no regulator, the
board's .dts should provide a fixed always-on regulator that
those properties can refer to, so that the driver can always
get() those regulators.
</tt></pre>
          </blockquote>
          <pre wrap=""><tt>
That'll add more dummy regulators and I don't think sprinkling them
across the DTS is going to work very well. Maybe collecting them
under a top-level "regulators" node is a good option. If you have a
better alternative, I'm all open for it.

</tt></pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap=""><tt>diff --git a/arch/arm/boot/dts/tegra20.dtsi
b/arch/arm/boot/dts/tegra20.dtsi
</tt></pre>
            </blockquote>
            <pre wrap=""><tt>
</tt></pre>
            <blockquote type="cite">
              <pre wrap=""><tt>+	pci {
</tt></pre>
            </blockquote>
            <pre wrap=""><tt>...
</tt></pre>
            <blockquote type="cite">
              <pre wrap=""><tt>+		status = "disable";
</tt></pre>
            </blockquote>
            <pre wrap=""><tt>
That should be "disabled"; sorry for providing a bad example.
</tt></pre>
          </blockquote>
          <pre wrap=""><tt>
Yes.

</tt></pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap=""><tt>diff --git a/arch/arm/mach-tegra/pcie.c
b/arch/arm/mach-tegra/pcie.c
</tt></pre>
            </blockquote>
            <pre wrap=""><tt>
</tt></pre>
            <blockquote type="cite">
              <pre wrap=""><tt>+static struct tegra_pcie_pdata *tegra_pcie_parse_dt(struct
platform_device *pdev)
</tt></pre>
            </blockquote>
            <pre wrap=""><tt>
</tt></pre>
            <blockquote type="cite">
              <pre wrap=""><tt>+	if (of_find_property(node, "vdd-supply", NULL)) {
</tt></pre>
            </blockquote>
            <pre wrap=""><tt>
As mentioned above, that if statement should be removed, since
the regulators shouldn't be optional.
</tt></pre>
          </blockquote>
          <pre wrap=""><tt>
Okay.

</tt></pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap=""><tt>+		pcie-&gt;vdd_supply = regulator_get(&amp;pdev-&gt;dev, "vdd");
</tt></pre>
            </blockquote>
            <pre wrap=""><tt>
Those could be devm_regulator_get(). Then tegra_pcie_remove()
wouldn't have to put() them.
</tt></pre>
          </blockquote>
          <pre wrap=""><tt>
Okay.

</tt></pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap=""><tt>+	for (i = 0; i &lt; TEGRA_PCIE_MAX_PORTS; i++) +
pdata-&gt;enable_ports[i] = true;
</tt></pre>
            </blockquote>
            <pre wrap=""><tt>
Shouldn't the DT indicate which ports are used? I assume there's
some reason that the existing driver allows that to be
configured, rather than always enabling all ports. At least,
enumeration time wasted on non-existent ports springs to mind,
and perhaps attempting to enable port 1 when port 0 is x4 and
using all the lanes would cause errors in port 0?
</tt></pre>
          </blockquote>
          <pre wrap=""><tt>
Yes, that's been on my mind as well. I'm not sure about the best
binding for this. Perhaps something like:

pci { enable-ports = &lt;0 1 2&gt;; };

Would do?
</tt></pre>
        </blockquote>
        <pre wrap=""><tt>
That seems reasonable, although since the property is presumably
something specific to the Tegra PCIe binding, not generic, I think it
should be nvidia,enable-ports.
</tt></pre>
      </blockquote>
      <pre wrap=""><tt>
I came up with the following alternative:

	pci {
		compatible = "nvidia,tegra20-pcie";
		reg = &lt;0x80003000 0x00000800   /* PADS registers */
		       0x80003800 0x00000200   /* AFI registers */
		       0x80004000 0x00100000   /* configuration space */
		       0x80104000 0x00100000   /* extended configuration space */
		       0x80400000 0x00010000   /* downstream I/O */
		       0x90000000 0x10000000   /* non-prefetchable memory */
		       0xa0000000 0x10000000&gt;; /* prefetchable memory */
		interrupts = &lt;0 98 0x04   /* controller interrupt */
		              0 99 0x04&gt;; /* MSI interrupt */
		status = "disabled";

		ranges = &lt;0x80000000 0x80000000 0x00002000   /* 2 root ports */
			  0x80004000 0x80004000 0x00100000   /* configuration space */
			  0x80104000 0x80104000 0x00100000   /* extended configuration space */
			  0x80400000 0x80400000 0x00010000   /* downstream I/O */
			  0x90000000 0x90000000 0x10000000   /* non-prefetchable memory */
			  0xa0000000 0xa0000000 0x10000000&gt;; /* prefetchable memory */

		#address-cells = &lt;1&gt;;
		#size-cells = &lt;1&gt;;

		port@80000000 {
			reg = &lt;0x80000000 0x00001000&gt;;
			status = "disabled";
		};

		port@80001000 {
			reg = &lt;0x80001000 0x00001000&gt;;
			status = "disabled";
		};
	};

The "ranges" property can probably be cleaned up a bit, but the most
interesting part is the port@ children, which can simply be enabled in board
DTS files by setting the status property to "okay". I find that somewhat more
intuitive to the variant with an "enable-ports" property.

What do you think of this?</tt></pre>
    </blockquote>
    <br>
    The problem is that children of a PCI-ish bus have specific
    expectations about the parent address format - the standard
    3-address-cell PCI addressing.&nbsp; So making a PCI bus node - even if
    it is PCIe - with 1 address cell is a problem.<br>
    <br>
    Also, if a given address range is listed in "reg", it should not
    also be listed in "ranges".&nbsp; A block of addresses is either
    "claimed" by the parent node (reg property) or passed through to its
    children (ranges property), but not both.&nbsp; "reg" entries are
    appropriate for entities that pertain to the overall control of the
    bus interface itself, while "ranges" entries are for chunks of
    address space that are overlaid onto child devices.<br>
    <br>
    <blockquote
      cite="mid:20120612172041.GA28010-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org"
      type="cite">
      <pre wrap=""><tt>

Thierry
</tt></pre>
      <tt><br>
      </tt>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <tt><br>
      </tt>
      <pre wrap=""><tt>_______________________________________________
devicetree-discuss mailing list
<a class="moz-txt-link-abbreviated" href="mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org">devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org</a>
<a class="moz-txt-link-freetext" href="https://lists.ozlabs.org/listinfo/devicetree-discuss">https://lists.ozlabs.org/listinfo/devicetree-discuss</a>
</tt></pre>
    </blockquote>
  </body>
</html>

--------------070401020107020807070708--

--===============4878432567581297156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============4878432567581297156==--
