From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] clk: define and export __clk_get_debug for providers
Date: Wed, 25 Jun 2014 20:07:37 +0200
Message-ID: <44039675.8s16pHQIVH@wuerfel>
References: <1403713591-17179-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1403713591-17179-1-git-send-email-pdeschrijver@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-tegra@vger.kernel.org, Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@linaro.org>, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Wednesday 25 June 2014 19:26:31 Peter De Schrijver wrote:
> Define and export a new function __clk_get_debug which returns the debugfs
> directory entry pointer. This can be used by clock providers to add debugfs
> entries which are not related to a specific clock type. Examples include the
> ability to measure the rate of a clock. It can also be used by modules to
> create new debugfs entries. This is useful if you want to expose features
> for testing which can potentially cause system instability such as allowing
> to change a clock's rate from userspace.
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> 

Just an idea, but would it be better to add a pair of functions to add/remove
debugfs files rather than exposing the dentry itself?

	Arnd
