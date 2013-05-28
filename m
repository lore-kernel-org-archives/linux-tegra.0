From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [v3 1/6] ARM: tegra20: create a DT header defining CLK IDs
Date: Tue, 28 May 2013 16:09:38 -0600
Message-ID: <51A52B22.6080402@wwwdotorg.org>
References: <1369241136-21903-1-git-send-email-hdoyu@nvidia.com> <519D35A7.5090102@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <519D35A7.5090102-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/22/2013 03:16 PM, Stephen Warren wrote:
> On 05/22/2013 10:45 AM, Hiroshi Doyu wrote:
>> Create a header file to define the clock IDs used by the Tegra20 clock
>> binding. Remove the list of definitions from the binding documentation,
>> and refer the reader to the header file.
>>
>> This will allow the same header to be used by both device tree files,
>> and drivers implementing this binding, which guarantees that the two
>> stay in sync. This also makes device trees more readable by using names
>> instead of magic numbers.
> 
> I have applied patches 1, 3, 5 to Tegra's for-3.11/deps-for-clk branch,
> merged that into Tegra's for-3.11/dt branch, and then applied patches 2,
> 4, 6 to Tegra's for-3.11/dt branch.

Oops. I actually forgot to apply patches 2, 4, 6 before. I just applied
them. I noticed one issue: The new headers were added to
<dt-bindings/clk/>. However, some other similar files have since shown
up in <dt-bindings/clock/>. Since the latter location better matches the
path-names of the DT bindings themselves, I moved the header files while
applying the patches, and fixed up the usage.

> Once you send the drivers/clk changes that build on top of this, I'll
> create a tag and send a pull request to Mike to pick up the headers so
> he can apply the clk changes.
