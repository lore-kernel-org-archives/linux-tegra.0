From: Stephen Warren <swarren@nvidia.com>
Subject: RE: [PATCH v2] i2c: tegra: Check for overflow errors with BUG_ON.
Date: Mon, 15 Aug 2011 19:26:30 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF04AEA252A8@HQMAIL01.nvidia.com>
References: <1313434172-18319-1-git-send-email-dianders@chromium.org>
	<1313458336-31456-1-git-send-email-dianders@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1313458336-31456-1-git-send-email-dianders@chromium.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Doug Anderson <dianders@chromium.org>, Ben Dooks <ben-linux@fluff.org>, Vincent Palatin <vpalatin@chromium.org>, Rhyland Klein <rklein@nvidia.com>, Felipe Balbi <balbi@ti.com>
Cc: Lucas De Marchi <lucas.demarchi@profusion.mobi>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, Rakesh Iyer <riyer@nvidia.com>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, Jean Delvare <khali@linux-fr.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

Doug Anderson wrote at Monday, August 15, 2011 7:32 PM:
> This change doesn't fix any known problems but turns
> on the overflow detection feature of the i2c controller
> in the hopes of flushing out any current (or future)
> bugs in the i2c driver.
> 
> Inspired by a change on nvidia's git server:
>   http://nv-tegra.nvidia.com/gitweb/?p=linux-2.6.git;a=commit;h=266d1b7397284505e55d06254b497cb32be07b69
> 
> Signed-off-by: Doug Anderson <dianders@chromium.org>
> ---
> This takes Felipe Balbi's suggestion of making the overflow
> error non-fatal.

This seems like a reasonable debug aid/validation check to me;
Acked-by: Stephen Warren <swarren@nvidia.com>

-- 
nvpublic
