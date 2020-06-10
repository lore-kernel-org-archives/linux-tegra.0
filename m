From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH v1 10/18] dt-bindings: tegra: Document VI and CSI port
 nodes
Date: Wed, 10 Jun 2020 08:15:19 -0700
Message-ID: <075d9d2e-eaa8-1895-8759-64c682fee1c4@nvidia.com>
References: <1591768960-31648-1-git-send-email-skomatineni@nvidia.com>
 <1591768960-31648-11-git-send-email-skomatineni@nvidia.com>
 <20200610112303.GB805@valkosipuli.retiisi.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200610112303.GB805-S+BSfZ9RZZmRSg0ZkenSGLdO1Tsj/99ntUK59QYPAWc@public.gmane.org>
Content-Language: en-US
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sakari Ailus <sakari.ailus-X3B1VOXEql0@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, frankc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, hverkuil-qWit8jRvyhVmR6Xm/wNWPw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, helen.koike-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 6/10/20 4:23 AM, Sakari Ailus wrote:
> Hi Sowjanya,
>
> Thanks for the patchset.
>
> On Tue, Jun 09, 2020 at 11:02:32PM -0700, Sowjanya Komatineni wrote:
>> This patch documents Tegra VI and CSI port and endpoint nodes along
>> with the other required properties.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   .../display/tegra/nvidia,tegra20-host1x.txt        | 87 ++++++++++++++++++++++
>>   1 file changed, 87 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>> index 4731921..f70a838 100644
>> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.txt
>> @@ -65,6 +65,48 @@ of the following host1x client modules:
>>         - power-domains: Must include sor powergate node as csicil is in
>>           SOR partition.
>>   
>> +      Optional properties for csi node:
> What hardware does the csi node represent? A CSI-2 receiver? Something
> else?
>
> If you have two connections, you need two ports. The example isn't quite
> clear on this; it would appear to represent a single physical interface.

CS-2 receiver with 2 connections. one for sink with sensor to csi and 
other as source with csi to Tegra vi.

Was using separate port for sink and source and then I misunderstood 
device graph document and changed to have multiple endpoints in same port.

Will update this in v2 to have separate port for each sink and source 
endpoint in csi in dt and also in driver implementation.

>> +
>> +      - channel nodes: Max upto 6 channels/streams are supported with each CSI
>> +	brick can as either x4 or x2 based on hw connectivity to sensor.
>> +
>> +	Required properties:
>> +	- reg: channel/stream index
>> +	- nvidia,mipi-calibrate: Should contain a phandle and a specifier
>> +	  specifying which pads are used by this CSI port and need to be
>> +	  calibrated. See also ../display/tegra/nvidia,tegra114-mipi.txt.
>> +
>> +	- port: CSI port node and its endpoint nodes as per device graph
>> +          bindings defined in Documentation/devicetree/bindings/graph.txt.
>> +	  Required properties:
> You have both properties and nodes here. Same for the above (port is a
> node).
Will update document to separate out port node from properties
>
>> +	  - reg: csi port index based on hw csi lanes connectivity to the
>> +	    sensor.
>> +	  - bus-width: number of lanes used by this port. Supported lanes
>> +	    are 1/2/4.
> bus-width belongs to the endpoint. Note that this is for parallel busses
> only. If you need the number of lanes, the property is called data-lanes.
Will update in v2 for having separate ports for sink and source 
endpoints will move bus-width to endpoint.
>
>> +	  - endpoint@0: sink node
>> +	    Required properties:
>> +	    - reg: endpoint id. This is used to retrieve pad for creating
>> +	      media link
>> +	    - remote-endpoint: phandle to sensor endpoint
>> +	  - endpoint@1: source node
>> +	    - reg: endpoint id. This is used to retrieve pad for creating
>> +	      media link
>> +	    - remote-endpoint: phandle to vi port endpoint
>> +
>> +  Optional properties for vi node:
>> +  - ports: Video port nodes and endpoint nodes as per device graph bindings
>> +    defined in Documentation/devicetree/bindings/graph.txt
>> +    Max 6 ports are supported and each port should have one endpoint node.
>> +
>> +    Required properties:
>> +    - port: VI port node and its sink endpoint node
>> +      Required properties:
>> +    - reg: should match port index
>> +    - endpoint@0: sink node
>> +      Required properties:
>> +      - reg: endpoint id must be 0
>> +      - remote-endpoint: phandle to CSI endpoint node.
>> +
>>   - epp: encoder pre-processor
>>   
>>     Required properties:
>> @@ -340,6 +382,22 @@ Example:
>>   
>>   			ranges = <0x0 0x0 0x54080000 0x2000>;
>>   
>> +			ports {
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				port@0 {
>> +					reg = <0>;
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					imx219_vi_in0: endpoint@0 {
>> +						reg = <0>;
>> +						remote-endpoint = <&imx219_csi_out0>;
>> +					};
>> +				};
>> +			};
>> +
>>   			csi@838 {
>>   				compatible = "nvidia,tegra210-csi";
>>   				reg = <0x838 0x1300>;
>> @@ -362,6 +420,35 @@ Example:
>>   					 <&tegra_car TEGRA210_CLK_CSI_TPG>;
>>   				clock-names = "csi", "cilab", "cilcd", "cile", "csi_tpg";
>>   				power-domains = <&pd_sor>;
>> +
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +
>> +				channel@0 {
>> +					reg = <0>;
>> +					nvidia,mipi-calibrate = <&mipi 0x001>;
>> +
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					port@0 {
>> +						reg = <0>;
>> +						bus-width = <2>;
>> +
>> +						#address-cells = <1>;
>> +						#size-cells = <0>;
>> +
>> +						imx219_csi_in0: endpoint@0 {
>> +							reg = <0>;
>> +							remote-endpoint = <&imx219_out0>;
>> +						};
>> +
>> +						imx219_csi_out0: endpoint@1 {
>> +							reg = <1>;
>> +							remote-endpoint = <&imx219_vi_in0>;
>> +						};
>> +					};
>> +				};
>>   			};
>>   		};
>>   
