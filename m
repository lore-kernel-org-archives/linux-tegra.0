From: Embedded Engineer <embed786@gmail.com>
Subject: Re: Unstable Kernel behavior on an ARM based board
Date: Tue, 5 Mar 2019 18:32:19 +0500
Message-ID: <CA+_ZnZS7wimpnH+TnvM_ztnX3wbADpf5FUBd_8igqeg+FnFr5g@mail.gmail.com>
References: <CA+_ZnZTrGCzPLKWZdxBzV1Z9b+c-Sp27DeUeV2XFW0+ZNZipGw@mail.gmail.com>
 <e530ec49-942d-a993-9081-901c0ce29c75@arm.com>
 <CA+_ZnZTCtghS+oUdXGW+h6SVD6nMPfsyDAvOwEugrhx6NJ3yFg@mail.gmail.com>
 <20190304142546.GB24676@ulmo>
 <CA+_ZnZQRV_7ytmbQZvWZUuyYiai0+Yo-pqV19RKebWAwSQokxQ@mail.gmail.com>
 <20190305100731.uz6tleu3fkaruwb6@shell.armlinux.org.uk>
 <CA+_ZnZTeZLyCcjZduQODzjWxTpU96AefzvTBDFbq2CSjVQxONg@mail.gmail.com>
 <20190305112226.rhbl3dwopmip45ja@shell.armlinux.org.uk>
 <20190305115730.GE26369@ulmo>
 <CA+_ZnZQ1m8QyiMJWwmVvtdqiFRDYK8PocGpG38W0NyEZ3yA8zQ@mail.gmail.com>
 <20190305132350.pzfmz4yvh6ujgotn@shell.armlinux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190305132350.pzfmz4yvh6ujgotn@shell.armlinux.org.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Murzin <vladimir.murzin@arm.com>, Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Mar 5, 2019 at 6:23 PM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
>
> Is there no later u-boot you can use to rule that out?

This u-boot was working just fine with our board so didn't try
updating it to some newer version. Also the downstream u-boot has
different text base addresses than mainline ones I guess so didn't put
any effort in that.
