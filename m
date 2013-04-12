From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 1/3] ARM: tegra: pcie: Add tegra3 support
Date: Fri, 12 Apr 2013 11:01:52 -0600
Message-ID: <51683E00.4020506@wwwdotorg.org>
References: <1365435688-4179-1-git-send-email-jagarwal@nvidia.com> <51630ABB.1020200@wwwdotorg.org> <C79B248886DD134989C8FF6B096A91AB91B36FB300@BGMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <C79B248886DD134989C8FF6B096A91AB91B36FB300@BGMAIL01.nvidia.com>
Sender: linux-pci-owner@vger.kernel.org
To: Jay Agarwal <jagarwal@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, Krishna Thota <kthota@nvidia.com>, "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, "thierry.reding@avionic-design.de" <thierry.reding@avionic-design.de>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "olof@lixom.net" <olof@lixom.net>, Laxman Dewangan <ldewangan@nvidia.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "mturquette@linaro.org" <mturquette@linaro.org>, Juha Tukkinen <jtukkinen@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Hiroshi Doyu <hdoyu@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 04/12/2013 10:43 AM, Jay Agarwal wrote:
>> On 04/08/2013 09:41 AM, Jay Agarwal wrote:
>>> Signed-off-by: Jay Agarwal <jagarwal@nvidia.com>
>>>
>>> - Enable pcie root port 2 for cardhu
>>> - Make private data structure for each SOC
>>> - Add required tegra3 clocks and regulators
>>> - Add tegra3 specific code in enable controller
>>> - Modify clock tree to get clocks based on device
>>> - Based on git://gitorious.org/thierryreding/linux.git
>> 	
>> A couple more points on this patch:
>>
>> * You didn't mention that this series is based on Thierry's work-in-progress
>> tree, and not something immediately destined for upstream. As such, only
>> Thierry is expected to actually apply any of these patches.
>>
> [>] Stephen, I have mentioned it in comment description as Based on git://gitorious.org/thierryreding/linux.git, is this not enough?

Well, first off, there are many branches there, and secondly the branch
that a series is based on doesn't necessarily imply much about what you
expect people to do with it.

> 
>> * Your changes to the Tegra PCIe driver require that device tree include
>> extra clocks and regulators. You need to update
>> Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt to describe
>> these new requirements.
>
> [>] Should I create tegra30-pcie.txt? or made changes in tegra20-pcie.txt itself?

(What is "[>]"?)

It'd probably be simplest to edit tegra20-pcie.txt, and just mention the
extra requirements for Tegra30.
