From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: Add Tegra186 BPMP I2C binding
Date: Fri, 27 Jan 2017 22:42:27 -0700
Message-ID: <8841854b-d058-1a8d-3e40-955bf3546cef@wwwdotorg.org>
References: <20170127083939.20393-1-thierry.reding@gmail.com>
 <20170127083939.20393-2-thierry.reding@gmail.com>
 <20170127221857.GA15715@mithrandir.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner@vger.kernel.org>
In-Reply-To: <20170127221857.GA15715@mithrandir.ba.sec>
Sender: linux-i2c-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Wolfram Sang <wsa@the-dreams.de>, Rob Herring <robh+dt@kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 01/27/2017 03:19 PM, Thierry Reding wrote:
> On Fri, Jan 27, 2017 at 09:39:38AM +0100, Thierry Reding wrote:
>> From: Stephen Warren <swarren@nvidia.com>
>>
>> In Tegra186, the BPMP (Boot and Power Management Processor) owns certain
>> HW devices, such as the I2C controller for the power management I2C bus.
>> Software running on other CPUs must perform IPC to the BPMP in order to
>> execute transactions on that I2C bus. This binding describes an I2C bus
>> that is accessed in such a fashion.
>>
>> Signed-off-by: Stephen Warren <swarren@nvidia.com>
>> Reviewed-by: Simon Glass <sjg@chromium.org>
>> Signed-off-by: Tom Warren <twarren@nvidia.com>
>> Acked-by: Jon Hunter <jonathanh@nvidia.com>
>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>> ---
>>  .../bindings/i2c/nvidia,tegra186-bpmp-i2c.txt      | 42 ++++++++++++++++++++++
>>  1 file changed, 42 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/i2c/nvidia,tegra186-bpmp-i2c.txt
>
> Rob, sorry for not Cc'ing you earlier on this, but I had thought this
> binding had already been reviewed and acked since it is merged in
> U-Boot.

I'm pretty sure all the DT binding patches for Tegra186 that I submitted 
were ack'd by Rob. They were certainly all posted to relevant Linux 
lists and discussed and ack'd by someone before I pushed them into 
U-Boot. Probably 2nd quarter last year, or maybe 3rd.
