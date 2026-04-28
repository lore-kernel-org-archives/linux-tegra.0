Received: from jpms-ob01.noc.sony.co.jp (jpms-ob01.noc.sony.co.jp [211.125.140.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F331144BC87;
	Tue, 28 Apr 2026 13:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.125.140.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777381672; cv=none; b=ZbjW+raAi4k0FgbrjOckihhYhyoJA3AQFwlClchYmxwH4PMSKhtpXCT0ynR8alsiXbLMLS71H/MgAfqFcBcZZY+blUKCj3g+nSUMnUbou3z0bQ9ejNrsJoOua3sTeJVzRhiV3BLwN53g3x53Xi078S3pZB7V7pyXfYmOr8Fu0n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777381672; c=relaxed/simple;
	bh=OchKKLt9+Cgb8fGyJziupP2A1Fqw+PSpxW1pYFq9XJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KWTvJG1dCNXssVT/zV04O3co6e0w8Vs4/cGbxzXtVBaUPSHzmcmpDtQdX8S9IyWr3vqDyQDy0SJTta/347o9sB0j6itAWR8Yb1E9QQPC6yB2/Et3LVZPZQqbapv1GfkiAZ86G76HGGhDdgX93AhaHOPakKVXm6oi5qZy0ubyT+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=pass smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=dIq020Nc; arc=none smtp.client-ip=211.125.140.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="dIq020Nc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1777381670; x=1808917670;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=tBn8VqLDSKuQcw7PUXmOHeUfy7B2aRFPY4QqUqpeL/s=;
  b=dIq020NcrTPvbnExuJ58jMnsbZ0FeQ89QQi4FtPovCr1LdgUYg7rbnc3
   nUsHavrZFIwIHwFHo8MbfWVqoEk4oyekywXWqdT5rr3131Qc8o15zZoj2
   gsXiEGUcupFBs4LkN7e7ei7UqPcu8WTCII4fxbeUBWXlqKfL5oyeVViRs
   I0i/f384LnH3FcQRyp6zVg0fSFBqPwTOmDEYSWB2nzyq+3Z2FYW2oOauP
   GkPW3jIFgHf8Ut86O9qCFBmFMuXQN5o0e0GZLEQfAy3Wney6ZLQLCv9eb
   3eHhb4OiHtwoHDpWd6rV07B2oArK1lsauPylQp6/xJKSPFeR7M5scak9E
   Q==;
X-CSE-ConnectionGUID: OB5Ql42NSq2AYIwhtEDRfg==
X-CSE-MsgGUID: t6kLOp5AQxCjic2m4rFRzQ==
Received: from unknown (HELO jpmta-ob02.noc.sony.co.jp) ([IPv6:2001:cf8:0:6e7::7])
  by jpms-ob01.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 22:07:42 +0900
X-CSE-ConnectionGUID: dQXwq35VQs6FZkNfdUoPYQ==
X-CSE-MsgGUID: CInvrjD1Rz2rtwWAUCwLvQ==
X-IronPort-AV: E=Sophos;i="6.23,204,1770562800"; 
   d="scan'208";a="604129736"
Received: from unknown (HELO JPC00244420) ([IPv6:2001:cf8:1:573:0:dddd:eb3e:119e])
  by jpmta-ob02.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2026 22:07:42 +0900
Date: Tue, 28 Apr 2026 22:07:41 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
To: Gary Guo <gary@garyguo.net>, Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Richard Cochran <richardcochran@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>, Mike Leach <mike.leach@arm.com>,
	Leo Yan <leo.yan@arm.com>, Rahul Bukte <rahul.bukte@sony.com>,
	linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	Daniel Palmer <daniel.palmer@sony.com>,
	Tim Bird <tim.bird@sony.com>, linux-modules@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 1/4] kernel: param: initialize module_kset before
 do_initcalls()
Message-ID: <afCxHUrjr3Z22U6V@JPC00244420>
References: <20260427-acpi_mod_name-v4-0-22b42240c9bf@sony.com>
 <20260427-acpi_mod_name-v4-1-22b42240c9bf@sony.com>
 <DI3Z28IZZOT9.349TTWNN9VDMB@garyguo.net>
 <afABOMT_s9DvF6NY@JPC00244420>
 <DI4QQA6EGIA1.N8WRFWVKG91S@garyguo.net>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DI4QQA6EGIA1.N8WRFWVKG91S@garyguo.net>

Adding Tegra maintainers.

On Tue, Apr 28, 2026 at 12:10:50PM +0100, Gary Guo wrote:
> On Tue Apr 28, 2026 at 1:37 AM BST, Shashank Balaji wrote:
> > Hi Gary,
> >
> > On Mon, Apr 27, 2026 at 02:29:55PM +0100, Gary Guo wrote:
> >> On Mon Apr 27, 2026 at 3:41 AM BST, Shashank Balaji wrote:
> >> > module_kset is initialized in param_sysfs_init(), a subsys_initcall. A number
> >> > of platform drivers register themselves prior to subsys_initcalls
> >> > (tegra194_cbb_driver registers in a pure_initcall, for example). With an
> >> > upcoming patch ("driver core: platform: set mod_name in driver registration")
> >> > that sets their mod_name in struct device_driver, lookup_or_create_module_kobject()
> >> > will be called for those drivers, which calls kset_find_obj(module_kset, mod_name).
> >> > This causes a null deref because module_kset isn't alive yet.
> >> >
> >> > Fix this by initializing module_kset in do_basic_setup() before do_initcalls().
> >> > Modernize the pr_warn while we're at it.
> >> >
> >> > Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >> > Suggested-by: Gary Guo <gary@garyguo.net>
> >> 
> >> I didn't suggest this change :)
> >> 
> >> I suggested `pure_initcall`, which is just a one line change.
> >
> > Oops, sorry about the misattribution.
> >
> >> diff --git a/kernel/params.c b/kernel/params.c
> >> index 74d620bc2521..ac088d4b09a9 100644
> >> --- a/kernel/params.c
> >> +++ b/kernel/params.c
> >> @@ -957,7 +957,7 @@ static int __init param_sysfs_init(void)
> >>  
> >>  	return 0;
> >>  }
> >> -subsys_initcall(param_sysfs_init);
> >> +pure_initcall(param_sysfs_init);
> >>  
> >>  /*
> >>   * param_sysfs_builtin_init - add sysfs version and parameter
> >> 
> >> pure_initcall is level 0 so it happens before all other init calls. Does it not
> >> work?
> >
> > tegra194_cbb_driver registers itself in a pure_initcall too. We wouldn't
> > want the ordering of its registration and module_kset init to be link order
> > dependent.
> 
> It's the only device driver that does this. And I don't think it's supposed to.
> 
> >From documentation:
> 
> > A "pure" initcall has no dependencies on anything else, and purely
> > initializes variables that couldn't be statically initialized.
> 
> I understand that given large amount of drivers registering themselves during
> core/arch_initcall that there might be regressions if all of them are moved, but
> surely we can demote these two specific tegra driver to core/postcore_initcall?
> This will still be called earlier than init_machine call which happens during
> arch_initcall.
> 
> Looks like the tegra CBB driver is just doing error logging anyway.

That's a good point, Gary. Thanks!

Hi Thierry and Jonathan,

You can find the context for this email in this patch:
https://lore.kernel.org/all/20260427-acpi_mod_name-v4-1-22b42240c9bf@sony.com/

TL;DR: tegra194_cbb_driver and tegra234_cbb_driver are the only drivers
registering themselves as early as in a pure_initcall. This is a problem
on two fronts:
1. Philosophical: As Gary pointed out, pure_initcalls are intended to purely
initialize variables that couldn't be statically initialized. But these
are doing driver registrations.
2. module_kset not initialized at pure_initcall stage: This is needed to
set the module sysfs symlink. Since module_kset is not alive yet during
pure_initcalls, registering these drivers panics the kernel.

We would like to do the tegra cbb driver registration in a core_initcall
(or some later initcall works too), and move module_kset initialization
to a pure_initcall. Like this:

diff --git a/drivers/soc/tegra/cbb/tegra194-cbb.c b/drivers/soc/tegra/cbb/tegra194-cbb.c
index ab75d50cc85c..2f69e104c838 100644
--- a/drivers/soc/tegra/cbb/tegra194-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra194-cbb.c
@@ -2342,7 +2342,7 @@ static int __init tegra194_cbb_init(void)
 {
        return platform_driver_register(&tegra194_cbb_driver);
 }
-pure_initcall(tegra194_cbb_init);
+core_initcall(tegra194_cbb_init);

 static void __exit tegra194_cbb_exit(void)
 {
diff --git a/drivers/soc/tegra/cbb/tegra234-cbb.c b/drivers/soc/tegra/cbb/tegra234-cbb.c
index fb26f085f691..785072fa4e85 100644
--- a/drivers/soc/tegra/cbb/tegra234-cbb.c
+++ b/drivers/soc/tegra/cbb/tegra234-cbb.c
@@ -1774,7 +1774,7 @@ static int __init tegra234_cbb_init(void)
 {
        return platform_driver_register(&tegra234_cbb_driver);
 }
-pure_initcall(tegra234_cbb_init);
+core_initcall(tegra234_cbb_init);

 static void __exit tegra234_cbb_exit(void)
 {

Would this work?

Thanks,
Shashank
