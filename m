From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v6 1/2] arm64: tegra: add ACONNECT, ADMA and AGIC nodes
Date: Thu, 20 Jun 2019 11:01:05 +0100
Message-ID: <5da5b498-cbc7-26dd-bd68-7f2376eb6b30@nvidia.com>
References: <1560945082-24554-1-git-send-email-spujar@nvidia.com>
 <20190620093929.GI26689@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190620093929.GI26689@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Sameer Pujar <spujar@nvidia.com>
Cc: robh+dt@kernel.org, mark.rutland@arm.com, mkumard@nvidia.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 20/06/2019 10:39, Thierry Reding wrote:
> On Wed, Jun 19, 2019 at 05:21:21PM +0530, Sameer Pujar wrote:
>> Add DT nodes for following devices on Tegra186 and Tegra194
>>  * ACONNECT
>>  * ADMA
>>  * AGIC
>>
>> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
>> ---
>>  changes in current revision
>>    * updated ranges property for aconnect
>>    * renamed agic node
>>
>>  arch/arm64/boot/dts/nvidia/tegra186.dtsi | 67 ++++++++++++++++++++++++++++++++
>>  arch/arm64/boot/dts/nvidia/tegra194.dtsi | 67 ++++++++++++++++++++++++++++++++
>>  2 files changed, 134 insertions(+)
> 
> Applied to for-5.3/arm64/dt, thanks.
> 
> I ended up deciding to put the aconnect node among the nodes with unit-
> addresses, in the numerical order that it would fit in if the top-level
> aconnect node didn't exist. I think that looks much more consistent in
> the end, even though it's slightly bending the rules that we have.

Thanks. Good point, I had not thought that bit through. Works for me,
especially as the aconnect bus has a ranges property and so is
associated with an address range.

Cheers
Jon

-- 
nvpublic
