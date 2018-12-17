From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH V2 09/21] clk: tegra: dfll: add protection for
 find_vdd_map APIs
Date: Mon, 17 Dec 2018 13:38:28 +0200
Message-ID: <20181217113828.GC7714@pdeschrijver-desktop.Nvidia.com>
References: <20181213093438.29621-1-josephl@nvidia.com>
 <20181213093438.29621-10-josephl@nvidia.com>
 <a56194ce-ce96-8b3a-99e8-b4348db39f42@nvidia.com>
 <acaf37e4-e581-597f-fdcf-5f627e396b88@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <acaf37e4-e581-597f-fdcf-5f627e396b88@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Joseph Lo <josephl@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Fri, Dec 14, 2018 at 03:42:45PM +0800, Joseph Lo wrote:
> On 12/13/18 8:46 PM, Jon Hunter wrote:
> > 
> > On 13/12/2018 09:34, Joseph Lo wrote:
> > > The DFLL hardware supports both I2C and PWM based regulator. SW driver
> > > only touches I2C regulator when generating LUT. And shouldn't touch it
> > > anymore once the DFLL is enabled.
> > 
> > I am not sure that the last two sentences are above are relevant and
> > confused me a little at first. I would be tempted to drop them.
> 
> Indeed, they are irrelevant. Just want to describe that once we created LUT
> table, it means we cached the regulator output table in driver. Then we
> don't need to query voltage data from regulator again. This is specific to
> the I2C mode only and happens in driver initialization time. Which means the
> two APIs we add the WARN here maybe not really necessary. Because this is
> suggested by Peter.
> 
> Hi Peter,
> 
> Just want to double confirm again, do we really need to add a WARN here?
> Since we don't and shouldn't access these two APIs once the driver is
> working, all the voltage query should be via LUT. So I think add WARN here
> is not really necessary.

It's not really necessary. It's more of a safeguard to make sure someone
who modifies the code later and might not be aware of this limitation
would accidently call the functions when PWM mode is in use.

Peter.
