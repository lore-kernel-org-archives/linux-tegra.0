From: Embedded Engineer <embed786@gmail.com>
Subject: Re: Unstable Kernel behavior on an ARM based board
Date: Sat, 9 Mar 2019 12:50:46 +0500
Message-ID: <CA+_ZnZTizztzr6BHVMoN5aAHmJoGAvbnYZm3UjPvHG1FtZp8Xg@mail.gmail.com>
References: <CA+_ZnZTeZLyCcjZduQODzjWxTpU96AefzvTBDFbq2CSjVQxONg@mail.gmail.com>
 <20190305112226.rhbl3dwopmip45ja@shell.armlinux.org.uk>
 <20190305115730.GE26369@ulmo>
 <CA+_ZnZQ1m8QyiMJWwmVvtdqiFRDYK8PocGpG38W0NyEZ3yA8zQ@mail.gmail.com>
 <20190305132350.pzfmz4yvh6ujgotn@shell.armlinux.org.uk>
 <CA+_ZnZS7wimpnH+TnvM_ztnX3wbADpf5FUBd_8igqeg+FnFr5g@mail.gmail.com>
 <20190305142351.ktciqkj5kycdwilr@shell.armlinux.org.uk>
 <CA+_ZnZQhvf5R2f-uMPPO3AgNbXTtoxcqpCYZR_Sb13jHN5X5wA@mail.gmail.com>
 <20190305145853.qsmcaop4ths2jgrl@shell.armlinux.org.uk>
 <CA+_ZnZSTkA8vj4QYJizL=YUcvtiabrVzKtDUPYO+2v-AkgRSpw@mail.gmail.com>
 <20190305153111.frvgnoba646uf5ar@shell.armlinux.org.uk>
 <47d0bea5-0dfe-9ce0-fedc-92061769e0a1@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <47d0bea5-0dfe-9ce0-fedc-92061769e0a1@gmx.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Clemens Koller <clemens.ml@gmx.net>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Vladimir Murzin <vladimir.murzin@arm.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 5, 2019 at 9:01 PM Clemens Koller <clemens.ml@gmx.net> wrote:
>
> Yes, this really smells like memory timing issues.
> Did you try the more extensive memory test of the latest u-boot? The regular one is quite naive. This is usually *not* enabled as default.

Unfortunately I was unable to get the latest (or any other upstream)
u-boot running on my board and even on Jetson TK1 kit. Although it
seems that the u-boot has support for Jetson TK1 in mainline but don't
know why its not working. The mtest command in the Nvidia's downstream
version of u-boot did not report any errors.

> Then, a Shmoo plot with different memory timing/voltage/temperature might be useful as well as a PCB layout review.

Tried running Shmoo test again but it generated the BCT file with same
parameters again. So it didn't seem to work.

I also stopped u-boot at command line and checked using oscilloscope
if there's some activity at data lines between DDR and TK1 processor.
There was no activity on data lines which made me believe that when
u-boot is in idle state, there's no peripheral (or DMA) writing to
memory which might be corrupting the memory used by kernel as suggest
by Thierry Reding.

Can anyone give some other suggestion as it seems I'm running out of
options to test :(
