From: Embedded Engineer <embed786@gmail.com>
Subject: Re: Unstable Kernel behavior on an ARM based board
Date: Mon, 4 Mar 2019 20:51:24 +0500
Message-ID: <CA+_ZnZRFMSmpJCG304MSMsA+aMjb9Qmsw6w-Cjv-uC2KRhXptQ@mail.gmail.com>
References: <CA+_ZnZTpES5bGZ0Cprnpy7HapMP3i=VTHgMZco6jq2zcKQzAVg@mail.gmail.com>
 <20190302113651.zerdonykcvv5ex3e@shell.armlinux.org.uk>
 <CA+_ZnZR_aTubOh3PJEVK0hbcDxxfK3vW1eLoknVo1yRBExawsw@mail.gmail.com>
 <20190302115729.zbowssfwf4j7jf22@shell.armlinux.org.uk>
 <CA+_ZnZS48d0OOTQJjktieO-yf09Ch6MRQLFoCjRtUgcXMrjWmg@mail.gmail.com>
 <20190302123907.qoe46qs6qmx7qnjs@shell.armlinux.org.uk>
 <453072a9-52e2-7591-750f-624ca27e0bbf@gmx.net>
 <CA+_ZnZTrGCzPLKWZdxBzV1Z9b+c-Sp27DeUeV2XFW0+ZNZipGw@mail.gmail.com>
 <e530ec49-942d-a993-9081-901c0ce29c75@arm.com>
 <CA+_ZnZTCtghS+oUdXGW+h6SVD6nMPfsyDAvOwEugrhx6NJ3yFg@mail.gmail.com>
 <20190304142546.GB24676@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190304142546.GB24676@ulmo>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Vladimir Murzin <vladimir.murzin@arm.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Thanks a lot Thierry for considering this thread.

On Mon, Mar 4, 2019 at 7:25 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> Or it could indicate that something is
> wrong when loading files from the root filesystem.

When I used the downstream kernel and L4T filesystem, there was no
problem regarding filesystem mounting.

> All of the memory related configuration is part of a file called the
> BCT. I think if you could provide that it would be very useful to have.

Please find the link to our BCT:
https://drive.google.com/open?id=1Az4nDIImCm14cnDSfHeBPlQYlYijGMrS

> Also, it looks like you're using the Jetson TK1 device tree to boot, so
> can I assume you haven't modified it at all?

Yes, I modified the downstream kernel's dtb by generating new pinmux
using Nvidia's dts generation tool but for upstream kernel I haven't
modified any dts.

> Other bits of information that would be good to know are how you are
> generating the BCT and your boot images, what exactly you do to flash
> the board and which release of L4T you use.

We run Shmoo memory characterization tool and get cfg file from that.
Then we convert that cfg to BCT (using mkbct command I guess).
We were never able to flash the board using nvflash/flash.sh utility. So
1. We build and flash u-boot & BCT using tegra-uboot-flasher.
2. We build kernel using make separately using sources available on
Nvidia download center.
3. We use apply_binaries.sh to copy tegra related files to sample file
system downloaded from Nvidia download center.
4. We mount the emmc/SD-card using u-boot's ums command on our Linux
host, and copy the whole filesystem, kernel and DTB to it.

We are using R21.7

> Perhaps also try to run a recent linux-next just to exclude any issues
> that may have been part of the 4.8.0-rc7 that you tested.

Ok I will build kernel using linux-next and update here.

Thanks again.
