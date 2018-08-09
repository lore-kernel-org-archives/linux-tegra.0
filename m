From: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [GIT PULL 5/5] arm64: tegra: Device tree changes for v4.19-rc1
Date: Thu, 9 Aug 2018 13:34:37 +0300
Message-ID: <51a19ec3-8b34-56f5-d9c7-69397d3d11ff@kapsi.fi>
References: <20180712154128.22705-1-thierry.reding@gmail.com>
 <20180712154128.22705-6-thierry.reding@gmail.com>
 <20180714212210.at4b2gcpopsznyxx@localhost> <20180803104318.GA28546@ulmo>
 <CAHMsQjU=nmpTnPK6Ryhui67YVANHExd=yRB4hp+upd7O-Tjn+Q@mail.gmail.com>
 <20180809102104.GB21639@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180809102104.GB21639@ulmo>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>, Anthony Eden <aeden@csail.mit.edu>
Cc: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, arm@kernel.org, Olof Johansson <olof@lixom.net>, Mikko Perttunen <mperttunen@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 09.08.2018 13:21, Thierry Reding wrote:
> On Fri, Aug 03, 2018 at 07:26:04AM -0400, Anthony Eden wrote:
>> Mesa support aside- if I start a computationally intensive job on the
>> Jetson TX2 like building the Linux kernel on all cores, it will lock
>> up. My only work around has been to disable the Denver CPU's. I don't
>> think the tegra186 has upstream support to control the fan on the
>> Jetson TX2, could this be a thermal problem?
> 
> Yes, I suppose this could be a thermal problem. Or it could be something
> else entirely. We do support CPU frequency scaling on Tegra X2, so what
> you could do is keep the Denver CPUs enabled, but set the powersave CPU
> frequency governor. That way it should use all the CPUs but at a lower
> clock rate, which should also be able to avoid any thermal issues. This
> could help determine whether or not the problem is thermal or something
> else.
> 
> Also adding Mikko on Cc who wrote the Tegra186 driver, maybe he's aware
> of any issues.

I haven't seen any issues myself, though I haven't stressed the CPU too 
heavily. We also have a thermal driver for Tegra186, so we could set up 
thermal throttling with a device tree change.

> 
> Thierry
> 
