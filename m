From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] ARM: add drivers for Colibri T30 to multi_v7_defconfig
Date: Mon, 19 May 2014 22:51:22 -0700
Message-ID: <20140520055122.GP18956@quad.lixom.net>
References: <1400103110-17574-1-git-send-email-stefan@agner.ch>
 <537503FA.5070605@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <537503FA.5070605@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, arm@kernel.org, thierry.reding@gmail.com, linux-arm-kernel@lists.infradead.org, stefan@agner.ch
List-Id: linux-tegra@vger.kernel.org

On Thu, May 15, 2014 at 12:14:18PM -0600, Stephen Warren wrote:
> On 05/14/2014 03:31 PM, stefan@agner.ch wrote:
> > From: Stefan Agner <stefan@agner.ch>
> > 
> > Toradex Colibri Evaluation Board uses the DS1307 RTC and the
> > MCP251x CAN controller. The NVIDIA Tegra 3 based Colibri T30
> > module can be used on this carrier board, hence enable those
> > drivers in tegra_defonfig and multi_v7_defconfig.
> > 
> > Furthermore the NVIDIA Tegra 3 based Apalis T30 module too
> > contains two MCP251x CAN controller.
> 
> Acked-by: Stephen Warren <swarren@nvidia.com>

Applied.


-Olof
